# Some XOD nodes

XOD is a flow-based-programming tool for programming arduino. See https://xod.io && https://github.com/xodio/xod .

This (https://github.com/awgrover/xod_lib) is a library of nodes for it. Some may be useful. Some may be ill conceived.

# Installation

The XOD project is working on an easier way to install libraries, until then you have to put the 'awg' directory into the xod workspace lib manually.

1. From this github repository https://github.com/awgrover/xod_lib
1. Click "clone or download", click "Download zip"
1. Open the downloaded zip, or let your OS just open it as it downloads.
1. Navigate into the zip, inside 'lib'. So you can see the 'awg' directory.
1. Find your xod workspace: run xod, choose File:Select Workspace. Note the "Current workspace directory". You can probabably select and copy it.
1. Open your file-explorer, and navigate to the xod workspace.
1. Make a directory "\_\_lib\_\_"
1. Drag 'awg' from the zip to '\_\_lib\_\_' in the workspace.
1. It's installed.
1. Do a "reload" in XOD.
1. My libs should be visible and usable.

# Nodes 
More detailed documentation at [NODES.md](/NODES.md)
<span id="auto generated below here"></span>
### awg/conversions/data-to-pulse
Convert anything into a pulse
### awg/conversions/true-to-pulse
Convert (each) true into a pulse. Compare with cast-boolean-to-pulse
### awg/count/count
From START to LIMIT by STEP each INC. Then reset to START. Either up or down. aka Sawtooth.
### awg/count/limited-counter
Count up/down on each  INC pulse. Will not exceed MAX or go-below MIN. I.e. Count up to MAX. Won't output if nothing changes (e.g. RST when already MIN, or just changing STEP)
### awg/count/simple
Simplified count: 0 to 1 by INC. Then repeat. Default is 256 steps suitable for LEDs etc. aka sawtooth.
### awg/count/steps
counts from 0 to LIMIT in N steps. e.g. 0..1000 in 255 steps. sawtooth.
### awg/hardware/digital-input
Reads digital signal value from board port. Can set input-pullup.
### awg/logical/if-else-string
Outputs either input value depending on condition
### awg/logical/string-compare
Compares 2 strings, giving <, =, or > boolean output.
### awg/midi
Constructs the midiEventPacket_t packet.  See https://github.com/arduino-libraries/MIDIUSB/blob/master/src/MIDIUSB.h
### awg/util/clock-per-second
Produce n ticks/sec. aka Hz
### awg/util/log-data
Output the DATA on the console-log, possibly followed by a space. End-of-line is optional. So you can output more than 1 thing per line.
### awg/util/timestamp
output "[time] prefix data". So you can see when it happened, what it's for (prefix). Unlike console-log, this outputs on prefix, or data. Of course, also on trig.
### awg/values/boolean
On pulse or boolean, copy the boolean out. Set always=false to only copy if the boolean has changed. Acts like casting pulse to boolean
### awg/values/number
On pulse or number, copy the number out. Set always=false to only copy if the number has changed. Acts like casting pulse to number
### awg/values/text
On pulse or text, copy the text out. Set always=false to only copy if the text has changed. Acts like casting pulse to text
