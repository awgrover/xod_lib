use strict; use warnings; no warnings 'uninitialized'; use 5.010; no if ($^V ge v5.18.0), warnings => 'experimental::smartmatch';

use XODDebug;

package XODProjectCommon; # just for common stuff
  use JSON;

  sub debug(&){ goto &main::debug; }
  sub warning { goto &main::warning; }
  sub FIXME{ goto &main::FIXME; }

  sub json_file {
    my $self=shift;
    my ($file) = @_;

    if (!$self->exists) {
      return {};
      }

    my $path = $self->path . "/$file";
    #debug {"read json patch $path" };

    if (-d $path) {
      warning "Was a directory: ".$path;
      return undef;
      }

    $self->from_json_file($path);
    }

  sub from_json_file {
    my $self = shift;
    my ($path) = @_;

    local @ARGV = $path;
    my $rez = eval {  decode_json(join("",<>)); };
    if ($@) {
      warn "In ".$path." : ";
      warn $@;
      exit 1;
      }
    warning "No json in $path" if !$rez;
    $rez;
    }
# END XODProjectCommon

package XODPatch;
  use base('XODProjectCommon');

  use Class::MethodMaker 
    [ 
    new => [ qw( -init new )],
    scalar => [ 
      'parent', # a XODProject/lib
      'name', # patchname
      '_xodp', # cached .xodp
      ],
    ];

  use File::Basename qw(basename dirname);
  use Carp;
  use JSON;
  use Cwd;

  sub debug(&){ goto &main::debug; }
  sub warning { goto &main::warning; }
  sub FIXME{ goto &main::FIXME; }

  sub init {
    my $self=shift;
    my ($parent, $name) = @_;
    $self->parent($parent);
    $self->name($name);
    #debug { "XODPatch from ".$self->parent->short_name.": ".$self->name };
    }

  sub type { 'patch' }

  sub path { 
    my $self = shift;
    $self->parent->path . "/" . $self->name;
    }

  sub exists {
    # does the patch actually exist
    my $self=shift;
    -e $self->path . "/patch.xodp";
    }

  sub short_name {
    my $self=shift;
    $self->parent->short_name . "/". $self->name;
    }

  sub mv {
    my $self=shift;
    my ($to, %keyargs) = @_;
    my $author = $keyargs{'author'};

    debug { "mv ".$self->short_name." -> ".$to->short_name };

    my @project_ct;

    if (!$self->exists) {
          warn "# Source patch doesn't exist: ".$self->path."/patch.xodp\n";
          exit 2;
          }
    if ($to->exists || -e($to->path) ) {
          warn "# Destination patch/dir already exists, don't know how to replace and update names in that case: ".$to->path."\n";
          exit 2;
          }

    my $patch_ct;

    $self->_mv( $to );
    $patch_ct = $to->rename_at_types( $self->parent );
    $patch_ct += $to->rename_relative_types; # if they now refer to $to->parent, make '@'
    if ($patch_ct) {
      warn "# edited ".$to->short_name." nodes $patch_ct\n";
      push @project_ct, $to->short_name;
      }

    # in this patch's parent
    debug {"rename in this ".$self->parent->short_name };
    $patch_ct = $self->parent->rename_types( $self, $to );

    if ($patch_ct) {
      warn "# edited ".$self->parent->short_name." patches $patch_ct\n";
      push @project_ct, $self->parent->short_name;
      }

    if ($self->parent->is_library) {
      # from a library means editing all other projects & libs

      debug {"rename in projects (since we modified a library)" };
      for my $proj ( @{XODProject->projects} ) {
        $patch_ct = $proj->rename_types( $self, $to );
        if ($patch_ct) {
          warn "# edited ".$proj->short_name." patches $patch_ct\n";
          push @project_ct, $proj->short_name;
          }
        }

      if (! $author) {
        warning "Can't edit libraries without an author.";
        }
      else {
        debug {"rename in $author/* libraries (since we modified a library)" };
        for my $lib ( @{XODProject->libraries($author)} ) {
          next if $lib->short_name eq $self->short_name;

          $patch_ct = $lib->rename_types( $self, $to );
          if ($patch_ct) {
            warn "# edited ".$lib->short_name." patches $patch_ct\n";
            push @project_ct, $lib->short_name;
            }
          }
        }
      }

    if (@project_ct) {
      my %names; @names{ $self->short_name, $to->short_name, @project_ct } = (undef,);
      say join(" ", sort keys %names)."\n";
      warn "# edited projects/libs: ".(keys %names)."\n";
      }
    }

  sub xodp_path { shift->path . "/patch.xodp"; }

  sub xodp {
    my $self=shift;
    return $self->_xodp if $self->_xodp;
    $self->_xodp( $self->json_file( "patch.xodp" ) );
    $self->_xodp;
    }

  sub nodes {
    my $self=shift;
    return undef if ! $self->xodp;
    $self->xodp->{'nodes'} || ( $self->xodp->{'nodes'} = [] );
    }

  sub comments {
    my $self=shift;
    return undef if ! $self->xodp;
    $self->xodp->{'comments'} || ( $self->xodp->{'comments'} = [] );
    }

  sub save {
    my $self=shift;
    if (!$self->_xodp) {
      die "Can't save, never read the xodp ".$self->short_name;
      }

    my $str = to_json($self->_xodp, {utf8=>1, pretty => 1, canonical=>1}); # can't: , indent_length =>2});
    $str =~ s/^((:?   )+)/ '  ' x (length($1)\/3) /egm; # indent 2
    $str =~ s/("[^"]+") :/$1:/gm;

    my $is_new = !$self->exists;

    if (! $::switches->{'n'}) {
      system('mkdir','-p',$self->path) and die($?);
      my $fh = IO::File->new( $self->xodp_path, 'w') || die($!);
      print $fh $str;
      $fh->close || die($!);
      }
    warn "# ".($::switches->{'n'} ? "(didn't) " : '').($is_new ? 'saved' : 'updated' )." ".$self->short_name."/patch.xodp\n";
    }

  sub _mv {
    # just the mv the patch dir to a new location
    my $self=shift;
    my ($to) = @_;

    debug { "  will create ".$to->short_name };
    die "No destination ".$to->parent->path if !$to->parent->exists;
    die "Already exists as destination ".$to->short_name."  ".$to->path if $to->exists || -e($to->parent->path . '/' . $to->name);
    
    warning "Needs Description" if !$self->xodp->{'description'};

    if (! $::switches->{'n'}) {
      system( 'mv', $self->path, $to->path ) and die($?);
      }
    else {
      # the appearance of having moved
      $to->_xodp( $self->xodp );
      }
    warn "#" .($::switches->{'n'} ? "(didn't)" : '') . " move ".$self->short_name." -> ".$to->short_name."\n";
    }

  sub rename_relative_types {
    # if they now refer to $self->parent, make '@'
    my $self=shift;
    my $nodes = $self->nodes || [];
    if (! @$nodes && ! @{$self->comments}) {
      warning "No nodes or comments in ".$self->short_name;
      return;
      }

    my @nodes_to_edit = grep { 
      # we edit and grep at same time
      if ( index($_->{'type'}, $self->parent->short_name) == 0 ) {
        $_->{'type'} = "@/" . basename( $_->{'type'} );
        }
      else {
        undef;
        }
      } @$nodes;
    return undef if !@nodes_to_edit;
    #debug { "nodes w/ new parent because the type == ".$self->parent->short_name.'/*' };
    #debug { "nodes w/ new parent ". join(", ", map {$_->{'type'} } @nodes_to_edit) };

    debug { "edited ".$self->short_name." xodp type to @/ : ".@nodes_to_edit };
      
    $self->save;
    return 1;
    }

  sub rename_at_types {
    # rename all @/type to $to/type
    my $self=shift;
    my ( $to_project ) = @_;

    if ($self->parent->short_name eq $to_project->short_name) {
      debug { "@ doesn't change if still in same project" };
      return undef;
      }

    my $nodes = $self->nodes || [];
    if (! @$nodes && ! @{$self->comments}) {
      warning "No nodes/comments in ".$self->short_name;
      next;
      }

    my @nodes_to_edit = grep { 
      # we edit and grep at same time
      if ( $_->{'type'} =~ /^\@\// ) {
        # to_project really needs to be a library if there are any @/ types in self
        die "You can't change an @ in ".$self->short_name." to refer to another project: ".$to_project.short_name if $to_project->is_project;
        $_->{'type'} = $to_project->short_name . "/" . $';
        }
      else {
        undef;
        }
      } @$nodes;
    #debug { "  nodes w/ @ ".@nodes_to_edit };
    return undef if !@nodes_to_edit;

    debug { "  edited ".$self->short_name." xodp type @/ back to ".$to_project->short_name." : ".@nodes_to_edit };
      
    $self->save;
    return 1;
    }

  sub custom_type {
    # as if the implied type were a real patch
    my $self=shift;
    my ($direction) = @_;
    die "Expected input|output: '$direction'" if $direction !~ /^(input|output)$/;

    die "Don't ask for the name of '$direction' custom type if not custom-type: ".$self->short_name if !$self->is_custom_type;
    $self->parent->patch( $direction."-".$self->name );
    }

  sub is_custom_type {
    my $self=shift;
    for my $node ( @{ $self->nodes ||[] } ) {
      return 1 if ( $node->{'type'} eq 'xod/patch-nodes/output-self' );
      }
    return undef;
    }

# end XODPatch

package XODProject;
  # Anything that has project.xod: project/library
  # Use .factory(path) to make the right subclass if thing already exists

  use base('XODProjectCommon');

  use Class::MethodMaker 
    [ 
    new => [ qw( -init new )],
    scalar => [ 
      'path', # canonical path
      'options', # hash, usually from argv
      '_project_xod', # cache for project.xod
      ],
    ];

  use File::Basename qw(basename dirname);
  use Carp;
  use JSON;

  our $workspace = Cwd::abs_path("/home/".$ENV{'USER'}.'/xod');

  sub debug(&){ goto &main::debug; }
  sub warning { goto &main::warning; }
  sub FIXME{ goto &main::FIXME; }

  sub type { 'project' }

  sub factory {
    # given a path, return the right kind of object: project|lib
    # Do not try to classify to patch

    my $self=shift; # class|object
    my ($path) = @_;
    debug {"# Factory classify: '$path'"};

    if (!-e $path) {
      # guess from pattern

      my $partct = split('/', $path);
      debug {"  # non-extant, parts $partct"};

      if ($partct == 1) {
        # project
        debug { "Assume new xodproject: 1 part path" };
        XODProject->new( "$workspace/$path" );
        }
      elsif ($partct == 2) {
        # author/lib
        debug { "Assume a new library: 2 part path" };
        XODLibrary->new( "$workspace/__lib__/$path" );
        }
      elsif ($partct == 3) {
        if ($path =~ /(^|\/)(lib|__lib__)\// ) {
          debug { "Assume a new library-patch: 3 part path" };
          XODLibrary->new( dirname($path) )->patch( basename($path) );
          }
        else {
          die "Can't classify non-extant path, expected project or author/lib[/patch]: $path";
          }
        }
      elsif ( $path =~ /(^|\/)(lib|__lib__)\// || index(Cwd::abs_path($path), "$workspace/__lib__") == 0 ) {
        # In lib, could be library, or a patch
        $path =~ /\b(lib|__lib__)\//;
        my $libname = $';
        debug { "Assume in lib|__lib__: classify $'" };
        
        $partct = split('/', $libname);

        if ($partct == 2) {
          # author/lib
          debug { "Assume new xodlibrary in lib/|__lib__ /a/b" };
          XODLibrary->new( $path );
          }
        elsif ($partct = 3) {
          debug { "Assume new library-patch in lib/|__lib__ /a/b" };
          XODLibrary->new( dirname($path) )->patch( basename($path) );
          }
        else {
          die "For non-extant path, expected author/name parts after lib|__lib__: $path" ;
          }
        }
      elsif ( index(Cwd::abs_path($path), $workspace) == 0 ) {
        # not lib, so project something
        my $projname = substr( length($workspace."/"), Cwd::abs_path( $path ));
        debug { "Assume new xodproject: in ~/xod/$projname" };
        
        $partct = split('/', $projname);

        if ($partct == 1) {
          # project
          debug { "Assume new project in workspace/a" };
          XODProject->new( "$workspace/$path" );
          }
        else {
          die "Can't classify the non-extant path in workspace, expected project: $path";
          }
        }
      else {
        die "Can't classify the non-extant path, should look like project, author/lib, ~/xod/project, or something in lib|__lib__: $path";
        }
      }

    # existing dir
    else { 
      debug { "  # Derive from extant..." };

      if ( $path =~ /(^|\/)(lib|__lib__)\// || index(Cwd::abs_path($path), "$workspace/__lib__/") == 0 ) {
        debug { "  # library lib|__lib__" };
        $path =~ /(^|\/)(lib|__lib__)\//;
        my $project_path = $';
        my $partct = split('/', $project_path);

        if ($partct == 2) {
          debug { "  # just lib: 2 parts" };
          my $rez = XODLibrary->new( $path );
          warning "No project.xod in $path" if !$rez->exists;
          $rez;
          }

        elsif ($partct = 3) {
          debug { "  # patch: 3 parts" };
          my $rez = XODLibrary->new( dirname($path) )->patch( basename($path) );
          warning "No patch.xodp in $path" if !$rez->exists;
          $rez;
          }
        }

      elsif ( index(Cwd::abs_path($path), "$workspace/") == 0 ) {
        debug { "  # project in workspace" };
        my $project_path = substr( Cwd::abs_path($path), length("$workspace/") );
        my $partct = split('/', $project_path);

        if ($partct == 1) {
          debug { "  # just project: 1 parts" };
          my $rez = XODProject->new( $path );
          warning "No project.xod in $path" if !$rez->exists;
          $rez;
          }

        elsif ($partct == 2) {
          debug { "  # patch: 2 parts" };
          my $rez = XODProject->new( dirname($path) )->patch( basename($path) );
          warning "No patch.xodp in $path" if !$rez->exists;
          $rez;
          }
        }
      
      else {
        debug { "  # assume project elsewhere" };
        if (-e "$path/patch.xodp") {
          debug { "  # patch.xodp" };
          XODProject->new( dirname($path) )->patch( basename($path) );
          }
        elsif (-e "$path/project.xod") {
          debug { "  # project.xod" };
          XODProject->new( $path );
          }
        else {
          my $rez = XODProject->new( $path );
          warning "No project.xod in $path" if !$rez->exists;
          $rez;
          }
        }
      }
    }

  sub init {
    my $self=shift;
    debug {"init ".ref($self)." args ".join(",",@_) };
    my ($path, @options) = @_;
    
    $self->path( Cwd::abs_path($path) );

    my %options = @options;
    $self->options( \%options );

    die "Couldn't figure abs_path('$path'), didn't give prefix to workspace?" if !$self->path;
    }

  sub patch {
    # patch object in project
    my $self=shift;
    my ($patchname) = @_;
    #debug {"making patch"};
    XODPatch->new($self, $patchname );
    }

  sub name {
    # same
    shift->short_name;
    }

  sub is_project {
      my $self=shift;
      $self->type eq 'project';
      }

  sub is_library {
      my $self=shift;
      $self->type eq 'library';
      }

  sub project_name {
    # from the project.xod
    shift->project_xod->{'name'};
    }

  sub exists {
    # does the project/lib actually exist
    my $self=shift;
    -e $self->path . "/project.xod";
    }

  sub path_tail {
    # 1 for project, 2 for lib
    my $self=shift;
    my ($ct, $apath) = @_;
    my @parts = basename($apath);

    my $dir = dirname($apath);
    for ((1..($ct-1))) {
      unshift @parts, basename($dir);
      $dir = dirname($dir);
      }

    join("/", @parts);
    }

  sub short_name {
    my $self=shift;
    basename($self->path);
    }

  sub rename_types {
    # just rename references in ourselves
    # but, for the from->to, and implied custom_types

    my $self = shift;
    my ($from, $to) = @_;

    my $patch_ct = $self->_rename_types( $from, $to );

    if ($from->is_custom_type) {
      for my $direction (qw(input output)) {
        my $fromcustom = $from->custom_type($direction);
        my $tocustom = $to->custom_type($direction);
        debug {"rename ".$fromcustom->short_name." to ".$tocustom->short_name };
        $patch_ct += $self->_rename_types( $fromcustom, $tocustom );
        }
      }

    return $patch_ct;
    }

  sub _rename_types {
    # just the from->to

    my $self=shift;
    my ($from, $to) = @_;

    # debug { "Rename in ".($self->type)." ".$self->short_name." ".$from->short_name." -> ".$to->short_name };

    my $new_node_name = $to->short_name;
    my $old_node_name = $from->short_name;

    # if same proj/library
    if ($self->short_name eq $to->parent->short_name) {
      #debug { "# same to so @" };
      $new_node_name = '@/' . $to->name;
      }
    # if same proj/library
    if ($self->short_name eq $from->parent->short_name) {
      #debug { "# same from so @" };
      $old_node_name = '@/' . $from->name;
      }

    #debug { "# rename in ".($self->type)." ".$self->short_name.", ".$old_node_name." -> $new_node_name" };

    my $patch_ct;

    for my $apatch ( @{ $self->patches() } ) {
      #debug { "Consider ".$apatch->short_name };

      # FIXME: probably should be in XODPatch as rename_type(...)
      my $nodes = $apatch->nodes || [];
      if (! @$nodes && !@{$apatch->comments ||[]}) {
        warning "No nodes/comments in ".$apatch->short_name;
        next;
        }

      my @nodes_to_edit = grep { 
        # we edit and grep at same time
        if ( $_->{'type'} eq $old_node_name ) {
          $_->{'type'} = $new_node_name;
          }
        else {
          undef;
          }
        } @$nodes;
      #debug { "  nodes w/ $old_node_name ".@nodes_to_edit };
      next if !@nodes_to_edit;

      $patch_ct += 1;
      #debug { "  edited ".$apatch->short_name." xodp type $old_node_name : ".@nodes_to_edit };
      debug { "# rename in ".$apatch->short_name.", ".$old_node_name." -> $new_node_name" };
        
      $apatch->save;
      }
    debug {"  edited patches $patch_ct"} if $patch_ct;
    $patch_ct;
    }

  sub patches {
    # in this project
    my $self=shift;

    my @patches;
    for my $projpath (glob($self->path . '/*')) {
      next if !-d $projpath;

      push @patches, $self->patch( basename($projpath) );
      warning "patch from globbing, but no patch.xodp exists: ".$patches[-1]->path  if !$patches[-1]->exists;
      pop @patches if !$patches[-1]->exists;
      }
    return \@patches;
    }

  sub projects {
    # just list 'em
    my $self=shift; # class|object

    my @projects;
    for my $projpath (glob("$workspace/*")) {
      next if !-d $projpath;
      # no __xx__
      my $subdir = basename($projpath);
      next if $subdir =~ /^__/;

      push @projects, XODProject->new( $projpath );
      }
    return \@projects;
    }

  sub libraries {
    # just list 'em: requires 'author'
    my $self=shift;
    my ($author) = @_;

    my @libs;
    for my $libpath (glob("$workspace/__lib__/$author/*")) {
      next if !-d $libpath;
      push @libs, XODLibrary->new( $libpath );
      }
    return \@libs;
    }

  sub project_xod {
    my $self=shift;
    return $self->_project_xod if $self->_project_xod;
    $self->_project_xod( $self->json_file( "project.xod" ) );
    $self->_project_xod;
    }

#end XODProject

package XODLibrary;
  # A thing that has a project.xod, but has other library semantics:
  # 3 level name
  #...

  use base('XODProject');

  use File::Basename qw(basename dirname);
  use Carp;
  use HTTP::Date;

  sub debug(&) { goto &main::debug; }
  sub warning { goto &main::warning; }
  sub FIXME { goto &main::FIXME; }

  my $SwaggerUrl = 'https://pm.xod.io';

  sub init {
    my $self=shift;
    my ($path) = @_;
    
    my $partct = split('/', $path);
    if ($partct == 2) {
      debug {"Assume in __lib__ 2part"};
      $self->SUPER::init( "$workspace/__lib__/$path", @_[1..(@_-1)] );
      }
    else {
      $self->SUPER::init(@_);
      }
    }

  sub type {'library'}

  sub name {
    # just the name part of author/name
    basename( shift->short_name );
    }

  sub short_name {
    my $self=shift;
    $self->path_tail(2, $self->path);
    }

  sub author {
    my $self=shift;
    dirname($self->short_name);
    }

  sub check_vs_published {
      my $self=shift;
      die "Can't check if it doesn't exist: ".$self->path if ! $self->exists;

      my $got = $self->get_published;
      return if !$got;

      # diff
      $self->diff_lib_published();

      # git clean check
      # warn if version
      }
  
  sub get_published_version_time {
      # the time or undef
      my $self=shift;

      my $version = $self->published_version;
      my $got = $self->get_published_cached(
        "users/".$self->author."/libs/".$self->project_name."/versions/latest",
        $version
        );

      debug {"published ".$self->from_json_file($version)->{'time'} };
      $got ? str2time( $self->from_json_file($version)->{'time'} ) : undef;
      }

    sub is_older {
      my ($a, $b) = @_;

      (-M $a) > (-M $b)
      }

    sub published_xodball {
      my $self=shift;
      ".published/versions/".$self->short_name.".xodball";
      }

    sub published_version {
      my $version = ".published/versions/".shift->short_name.".version";
      }

    sub published_version_time {
      my $self=shift;
      str2time( $self->from_json_file( $self->published_version )->{'time'} );
      }

    sub get_published_xodball {
      my $self=shift;
      my ($version_date) = @_;

      my $xodball = $self->published_xodball;
      debug {"get if old $xodball"};

      my $xodage = $version_date - ( $^T + ( (-e $xodball) ? (-M $xodball) : -$^T) ); 
      debug {"  xodball age ".$xodage };
      
      # old (slop)
      if ($xodage > 5 || $self->options->{'force'} ) {

        my $got = $self->get_published_cached(
            "users/".$self->author."/libs/".$self->project_name."/versions/latest/xodball", 
            $xodball
            );

        if ($got) {
          debug {"  update modtime to ".time2str($version_date) };
          system('touch', '-d', time2str($version_date), $xodball ) and die($?);
          }
        debug {"  Fetched xodball? $got"};
        $got ? $xodball : undef;
        }
      else {
        debug {"  Cached xodball is same age as .version, using it: $xodball"};
        $xodball;
        }
      }

    sub get_published_cached {
      my ($self) = shift;
      my ($url, $cache) = @_;
      debug {"  Fetch cached $cache from $url"};
     
      my $is_cached = undef;
      my $old_cache = undef;
      if (-e $cache) {
        $old_cache = 1;
        if (-M $cache < 1/(24*60) ) { # 1 minute
          debug {"  Cached, ". (-M $cache) * (24*60*60) ." secs old" };
          $is_cached = 1;
          }
        }

      if (!$is_cached) {

        if ( $self->options->{'no-remote'} ) {

          if (!-e $cache) {
            warn "Can't proceed with --no-remote, no $cache\n";
            return undef;
            }

          warning "Use old cache";
          }

        else {
          system( 'mkdir', '-p', dirname($cache)) and die($!);
          my @cmd = ('curl', '-L', '-s', '-o', $cache,  "$SwaggerUrl/$url" );
          debug {join ' ', @cmd};
          system(@cmd) and die($!);
          debug {"fetched $cache"};
          }
        }

      if (-z $cache) {
        warn "json for  0-length, probably mismatch lib-name vs. lib-path ".$self->short_name." for $url\n";;
        exit 2;
        }
      
      return $cache;
      }

  sub get_published {
      # get current xodball & semver, cached by time
      my $self=shift;

      my $published_at = $self->get_published_version_time;
      return undef if !$published_at;
      debug {"published at $published_at"};

      my $xodball = $self->get_published_xodball( $published_at );
      return undef if !$xodball;

      return 1;
      }

  sub published_xodball_unpacked {
    my $self=shift;
    my $path = ".published/versions/".$self->short_name;
    my $path_project_xod = "$path/project.xod";
    my $xodball  = $self->published_xodball;

    if (!-e $path || !-e $path_project_xod || is_older( $path_project_xod, $xodball) || $self->options->{'force'} ) {
      debug {"Unpack into $xodball"};
      debug { join( " ", './xodc', 'unpack', $xodball, $path) };
      system( './xodc', 'unpack', $xodball, $path_project_xod) and die($?);

      my $version_date = $self->published_version_time;
      debug {"  touch ".time2str($version_date) };
      system('touch', '-d', time2str($version_date), $path_project_xod ) and die($?);
      }
    return $path;
    }

  sub diff_lib_published {
    my $self=shift;

    my $xodball  = $self->published_xodball;
    my $unpacked  = $self->published_xodball_unpacked;

    # diff -R $lib $unpacked
    my @cmd = ( 'diff', '-r', '-q', $unpacked, $self->path);
    my $is_diff = system( @cmd );
    debug { "xodball/__lib__ diff? $is_diff : ".join(" ",@cmd) };
    $is_diff;
    }

# end XODLibrary

