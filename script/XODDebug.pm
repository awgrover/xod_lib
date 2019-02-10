use strict; use warnings; no warnings 'uninitialized'; use 5.010; no if ($^V ge v5.18.0), warnings => 'experimental::smartmatch';

use Carp;
$SIG{__DIE__} = sub { Carp::confess @_ };

sub debug(&) {
    if ($ENV{'DEBUG'}) {
      my @lines = &{$_[0]};
      my $at = (caller(0))[2];
      warn "[DEBUG $at] ". $lines[0]."\n";
      for ( @lines[1..(@lines-1)] ) {
        warn "[DEBUG ".(' ' x length("".$at))."] ". $_ . "\n";
        }
      }
    }

sub FIXME {
  my $at = (caller(0))[2];
  warn "[--FIXME-- $at] ", @_, "\n";
  }

sub warning {
    warn "WARNING ",@_,"\n";
    }

