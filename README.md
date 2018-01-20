# Some XOD nodes

XOD is a flow-based-programming tool for programming arduino. See https://xod.io && https://github.com/xodio/xod .

This (https://github.com/awgrover/xod_lib) is a library of nodes for it. Some may be useful. Some may be ill conceived.

# Installation

## XOD Add Library
1. Browse (https://xod.io/libs/) for "published" libraries, mine start with "awgrover"
1. File menu, Add Library, type the name, like "awgrover/utils".
1. should install.

## awgrover/midi
This requires FortySevenEffects/arduino_midi_library. A bit of a pain to install:
1. run arduino-ide
1. sketch:include library:manage-libraries...
1. search for "MIDI", find "MIDI Library by Forty Seven Effects"
1. latest version (has worked with 4.3.1, report problems please)
1. "install"
1. done with arduion-ide, you can close it
1. Find your "Arduino/libraries" folder.
1. It's "~/Arduino/libraries" on linux. Please send info on OS's not listed here.
1. Find your "XOD IDE/resources" directory. On my debian linux, it's '/opt/XOD IDE/resources/arduino-libraries'
1. You have to create a link (shortcut) from the arduino-library to the xod-arduino-lib. On linux it's:
    sudo ln -s ~/Arduino/libraries/MIDI_Library '/opt/XOD IDE/resources/arduino-libraries'
1. "Reload" in XOD
1. Should be ready to go

## Un-"published"
I haven't "published" all of these yet, until then you have to put the 'awgrover' directory into the xod workspace lib manually.

1. From this github repository https://github.com/awgrover/xod_lib
1. Click "clone or download", click "Download zip"
1. Open the downloaded zip, or let your OS just open it as it downloads.
1. Navigate into the zip, inside 'lib'. So you can see the 'awgrover' directory.
1. Find your xod workspace: run xod, choose File:Select Workspace. Note the "Current workspace directory". You can probabably select and copy it.
1. Open your file-explorer, and navigate to the xod workspace.
1. Make a directory "\_\_lib\_\_"
1. Drag 'awgrover' from the zip to '\_\_lib\_\_' in the workspace.
1. It's installed.
1. Do a "reload" in XOD.
1. My libs should be visible and usable.

# Nodes 
More detailed documentation at [NODES.md](/NODES.md)
<span id="auto generated below here"></span>
### awgrover/conversions/data-to-pulse
Convert anything into a pulse
### awgrover/conversions/true-to-pulse
Convert (each) true into a pulse. Compare with cast-boolean-to-pulse
### awgrover/count/count
From START to LIMIT by STEP each INC. Then reset to START. Either up or down. aka Sawtooth.
### awgrover/count/limited-counter
Count up/down on each  INC pulse. Will not exceed MAX or go-below MIN. I.e. Count up to MAX. Won't output if nothing changes (e.g. RST when already MIN, or just changing STEP)
### awgrover/count/simple
Simplified count: 0 to 1 by INC. Then repeat. Default is 256 steps suitable for LEDs etc. aka sawtooth.
### awgrover/count/steps
counts from 0 to LIMIT in N steps. e.g. 0..1000 in 255 steps. sawtooth.
### awgrover/hardware/button
This button signals up & down. The signal is immediate (debounce inhibits signals for 20msec). Assumes normally-open switch. Does input-pullup.
### awgrover/hardware/digital-input
Reads digital signal value from board port. Can set input-pullup.
### awgrover/logical/if-else-string
Outputs either input value depending on condition
### awgrover/logical/string-compare
Compares 2 strings, giving <, =, or > boolean output.
### awgrover/util/clock-per-second
Produce n ticks/sec. aka Hz
### awgrover/util/log-data
Output the DATA on the console-log, possibly followed by a space. End-of-line is optional. So you can output more than 1 thing per line.
### awgrover/util/timestamp
output "[time] prefix data". So you can see when it happened, what it's for (prefix). Unlike console-log, this outputs on prefix, or data. Of course, also on trig.
### awgrover/values/boolean
On pulse or boolean, copy the boolean out. Set always=false to only copy if the boolean has changed. Acts like casting pulse to boolean
### awgrover/values/number
On pulse or number, copy the number out. Set always=false to only copy if the number has changed. Acts like casting pulse to number
### awgrover/values/text
On pulse or text, copy the text out. Set always=false to only copy if the text has changed. Acts like casting pulse to text
### awgrover/x-midi/bank-program-change
Bank-Select and Program-Change
### awgrover/x-midi/control-change
Set the values, sends the control change on pulse ("send").
### awgrover/x-midi/debug
For this to work, it must fire first. Putting in the top-left helps. Sets baud to 115200 for debugging
### awgrover/x-midi/example-control-change
Real simple examples
### awgrover/x-midi/example-program-change

### awgrover/x-midi/note
explicitly start/stop a note. cf. -button
### awgrover/x-midi/note-button
A button starts the note (push) and stops on release. Uses xod/common-hardware/button
### awgrover/x-midi/program-change
Set the values, sent on pulse ("send")
