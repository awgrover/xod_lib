# awgrover/adafruit-neopixel-ll/adafruitneopixel
constructor
https://github.com/adafruit/Adafruit_NeoPixel
Arduino: Adafruit_NeoPixel
XOD: awgrover/adafruit-neopixel-ll/input-adafruitneopixel
cpp postfix: adafruitneopixel
## Inputs
> **n : number.**

> **p : number.**

> **t : number.**

## Outputs
> **adafruitneopixel : self.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/adafruitneopixel1
constructor
https://github.com/adafruit/Adafruit_NeoPixel
Arduino: Adafruit_NeoPixel
XOD: awgrover/adafruit-neopixel-ll/input-adafruitneopixel
cpp postfix: adafruitneopixel
## Inputs
**none**
## Outputs
> **done : pulse.**

# awgrover/adafruit-neopixel-ll/begin

## Inputs
> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/adafruit-neopixel-ll/can-show

## Inputs
> **trigger : pulse.**

## Outputs
> **val : boolean.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/clear

## Inputs
> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/adafruit-neopixel-ll/color

## Inputs
**none**
## Outputs
> **val : number.**

# awgrover/adafruit-neopixel-ll/defer(adafruitneopixel)
Allows to create feedback loops. Repeats a change of the input on the output right after the current transaction will complete.
## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-neopixel-ll/equal(adafruitneopixel)
Outputs true if `IN1` = `IN2`, and false otherwise
## Inputs
**none**
## Outputs
> **OUT : boolean.**

# awgrover/adafruit-neopixel-ll/example-rgb-revelation
Light up the first 3 pixels in Red, Green, Blue order.
Nearest the Arduino should be Red, then Green, then Blue.
This should help you decode the right RGB code to use (e.g. GRB, etc).
## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-neopixel-ll/example-rgb-revelation1pixel
Light up the first pixel in order: OFF, Red, Green, Blue.
Like the 3 pixel revelation, but this only requires 1 pixel.
This should help you decode the right RGB code to use (e.g. GRB, etc).
## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-neopixel-ll/example-simple
Turn all pixels light green, one by one.
Repeat.
Based on the Adafruit Neopixel example "simple",
## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-neopixel-ll/gamma8

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/gate(adafruitneopixel)
Allows values to pass through only if EN pin is set to true
## Inputs
> **EN : boolean.**
> Whether values should pass through

## Outputs
**none**
# awgrover/adafruit-neopixel-ll/get-brightness

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/get-pin

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/get-pixel-color

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/get-pixels

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/if-else(adafruitneopixel)
Outputs either input value depending on condition
## Inputs
> **COND : boolean.**
> Condition value

## Outputs
**none**
# awgrover/adafruit-neopixel-ll/num-pixels

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/readme

## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-neopixel-ll/set-pin

## Inputs
> **p : number.**

> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/adafruit-neopixel-ll/set-pixel-color

## Inputs
> **n : number.**

> **r : number.**

> **g : number.**

> **b : number.**

> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/adafruit-neopixel-ll/show

## Inputs
> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/adafruit-neopixel-ll/sine8

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-neopixel-ll/update-length

## Inputs
> **n : number.**

> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/adafruit-neopixel-ll/update-type

## Inputs
> **t : number.**

> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/conversions/data-to-pulse
Convert anything into a pulse
## Inputs
> **data : string.**
> Actually takes any

## Outputs
> **pulse : pulse.**

# awgrover/conversions/true-to-pulse
Convert (each) true into a pulse. Compare with cast-boolean-to-pulse
## Inputs
> **bool : boolean.**
> boolean, or Number (0=false, everything else is true)

## Outputs
> **pulse : pulse.**

# awgrover/count/count
From START to LIMIT by STEP each INC. Then reset to START. Either up or down. aka Sawtooth.
## Inputs
> **START : number (0).**
> Start the sequence at this value.

> **STEP : number (0.00390625).**
> Amount to change on each increment. Automatically deals with counting down.

> **LIMIT : number (1).**
> Limit of change, goes back to START on the next increment.

> **INC : pulse.**
> Triggers a single change.

> **RST : pulse.**
> Resets the sequence to START.

## Outputs
> **COUNT : number.**
> The current value.

# awgrover/count/limited-counter
Count up/down on each  INC pulse. Will not exceed MAX or go-below MIN. I.e. Count up to MAX. Won't output if nothing changes (e.g. RST when already MIN, or just changing STEP)
## Inputs
> **MIN : number.**
> Minimum value of OUT. Stops counting down when it hits this value. Will reset to this value on RST if STEP is positive.

> **STEP : number (0.00392157).**
> Value to add on each INC pulse. Use a negative value (e.g. -1) to make decrements.
Default is 0..1 in 255 steps of .00392156 suitable for PWM

> **INC : pulse.**
> On a pulse, add the STEP to the current OUT. Thus negative decrements. There will be no output if the OUT doesn't change. e.g. A STEP of 0.

> **MAX : number (1).**
> Maximum value of OUT. Stops counting up when it hits this value. Will reset to this value on RST if STEP is negative.

> **RST : pulse (ON_BOOT).**
> Reset the output to MIN. NB:  the default of "on boot" will cause OUT to be MIN on the first transaction. (if STEP is negative, then it will use MAX for above).

## Outputs
> **OUT : number.**
> The changing value, never below MIN or above MAX. Will not output unless this value changes.

# awgrover/count/simple
Simplified count: 0 to 1 by INC. Then repeat. Default is 256 steps suitable for LEDs etc. aka sawtooth.
## Inputs
> **STEP : number (0.256).**

> **INC : pulse.**

## Outputs
**none**
# awgrover/count/steps
counts from 0 to LIMIT in N steps. e.g. 0..1000 in 255 steps. sawtooth.
## Inputs
> **LIMIT : number (1).**

> **STEPS : number (255).**

> **INC : pulse.**

## Outputs
> **COUNT : number.**

# awgrover/hardware/button
This button signals up & down. The signal is immediate (debounce inhibits signals for 20msec). Assumes normally-open switch. Does input-pullup.
## Inputs
> **port : number.**
> any pin. other side of switch should be to ground

## Outputs
> **close : pulse.**
> pulse when button is pushed (closed)

> **open : pulse.**
> pulse when button is released (opened)

# awgrover/hardware/digital-input
Reads digital signal value from board port. Can set input-pullup.
## Inputs
> **PORT : number.**
> Number of a board digital port to read from

> **PULLUP : boolean.**
> use INPUT_PULLUP, i.e. pin is held high by  a large value resistor (~20k ohm). False is default INPUT behavior

> **UPD : pulse (CONTINUOUSLY).**
> Triggers new read

## Outputs
> **VAL : number (0).**
> The latest read value: 0 or 1

# awgrover/logical/if-else-string
Outputs either input value depending on condition
## Inputs
> **COND : boolean.**
> Condition value

> **T : string.**
> Value to be output if condition is true

> **F : string.**
> Value to be output if condition is false

## Outputs
> **R : string (0).**
> Outputs value of `T` if `COND` is true, and `F` otherwise

# awgrover/logical/string-compare
Compares 2 strings, giving <, =, or > boolean output.
## Inputs
> **a : string.**
> String 1 to compare

> **b : string.**
> string 2 to compare

## Outputs
> **less : boolean.**

> **eq : boolean.**

> **greater : boolean.**

# awgrover/midi/bank-program-change
Bank-Select and Program-Change
## Inputs
> **Prg# : number (1).**
> Progrm Change Number

> **MSB : number.**
> MSB for bank select

> **LSB : number.**
> LSB for bank select

> **Ch : number (1).**
> MIDI Channel

> **send : pulse.**
> Send when triggered

## Outputs
> **sent : pulse.**
> Pulse when sent

# awgrover/midi/control-change
Set the inputs, send the control change on pulse ("send").
## Inputs
> **CC : number (3).**
> Controller Number

> **Val : number.**
> Controller Value

> **Ch : number (1).**
> MIDI Channel

> **send : pulse.**
> Send when triggered

## Outputs
> **sent : pulse.**
> pulse when sent

# awgrover/midi/debug
For this to work, it must fire first. Putting in the top-left helps. Sets baud to 115200 for debugging
## Inputs
> **dumy : pulse (ON_BOOT).**

## Outputs
**none**
# awgrover/midi/example-compile-test

## Inputs
**none**
## Outputs
**none**
# awgrover/midi/example-control-change
Real simple examples
## Inputs
**none**
## Outputs
**none**
# awgrover/midi/example-program-change

## Inputs
**none**
## Outputs
**none**
# awgrover/midi/note
Start/stop a note.
## Inputs
> **Num : number (60).**
> Note number

> **Ch : number (1).**
> MIDI Channel

> **VelOn : number (64).**
> Velocity Level (on). often volume, depends on the instrument

> **VelOff : number.**
> some instruments respond to off-velocity, or have decay. Normally 0

> **play : pulse.**
> Send NoteOn when triggered

> **stop : pulse.**
> Send NoteOff when triggered

## Outputs
**none**
# awgrover/midi/note-button
A button starts the note (push) and stops on release. Uses xod/common-hardware/button
## Inputs
> **port : number (10).**
> pin for button

> **No. : number (60).**
> Note Number

> **Ch : number (1).**
> MIDI Channel

> **VelOn : number (64).**
> Velocity Level (on). Often volume, depends on the instrument

> **VelOff : number.**
> some instruments respond to off-velocity, or have decay. Normally 0

## Outputs
**none**
# awgrover/midi/program-change
Set the inputs, send on pulse ("send")
## Inputs
> **Prg : number (1).**
> Program Change Number

> **Ch : number (1).**
> MIDI Channel

> **send : pulse.**
> Send when triggered

## Outputs
> **sent : pulse.**
> Pulse when sent

# awgrover/util/clock-per-second
Produce n ticks/sec. aka Hz
## Inputs
> **Hz : number (1).**
> ticks/second

> **RST : pulse.**
> Resets clock. Hz starts from 'now'. e.g. Synchronize.

## Outputs
> **tick : pulse.**

# awgrover/util/log-data
Output the DATA on the console-log, possibly followed by a space. End-of-line is optional. So you can output more than 1 thing per line.
## Inputs
> **data : string.**

> **space : boolean (1).**
> Puts a space after DATA

> **EOL : boolean.**

## Outputs
> **chain : pulse.**
> pulses on output to chain these

# awgrover/util/timestamp
output "[time] prefix data". So you can see when it happened, what it's for (prefix). Unlike console-log, this outputs on prefix, or data. Of course, also on trig.
## Inputs
> **prefix : string ().**
> A label before the data:
ts] prefix data
Convenience for adding a label.

> **data : string.**
> Any data except pulse. Log the data on update.

> **trig : pulse.**
> also triggers output of current values

## Outputs
**none**
# awgrover/values/boolean
On pulse or boolean, copy the boolean out. Set always=false to only copy if the boolean has changed. Acts like casting pulse to boolean
## Inputs
> **boolean : boolean.**
> The boolean to copy

> **pulse : pulse.**
> Also copy on a pulse

> **always : boolean (1).**
> On pulse or boolean, copy 'boolean'. If false, only copy when 'boolean' changes.

## Outputs
> **copy : boolean.**
> The 'boolean'

> **trig : pulse.**

# awgrover/values/number
On pulse or number, copy the number out. Set always=false to only copy if the number has changed. Acts like casting pulse to number
## Inputs
> **number : number.**
> The number to copy

> **pulse : pulse.**
> Also copy on a pulse

> **always : boolean (1).**
> On pulse or number, copy 'number'. If false, only copy when 'number' changes.

## Outputs
> **copy : number.**
> The 'number'

> **trig : pulse.**

# awgrover/values/text
On pulse or text, copy the text out. Set always=false to only copy if the text has changed. Acts like casting pulse to text
## Inputs
> **text : string.**
> The text to copy

> **pulse : pulse.**
> Also copy on a pulse

> **always : boolean (1).**
> On pulse or text, copy 'text'. If false, only copy when 'text' changes.

## Outputs
> **copy : string.**
> The 'text'

> **trig : pulse.**

# awgrover/x-midi/bank-program-change
Bank-Select and Program-Change
## Inputs
> **Prg# : number (1).**
> Progrm Change Number

> **MSB : number.**
> MSB for bank select

> **LSB : number.**
> LSB for bank select

> **Ch : number (1).**
> MIDI Channel

> **send : pulse.**
> Send when triggered

## Outputs
> **sent : pulse.**
> Pulse when sent

# awgrover/x-midi/control-change
Set the inputs, send the control change on pulse ("send").
## Inputs
> **CC : number (3).**
> Controller Number

> **Val : number.**
> Controller Value

> **Ch : number (1).**
> MIDI Channel

> **send : pulse.**
> Send when triggered

## Outputs
> **sent : pulse.**
> pulse when sent

# awgrover/x-midi/debug
For this to work, it must fire first. Putting in the top-left helps. Sets baud to 115200 for debugging
## Inputs
> **dumy : pulse (ON_BOOT).**

## Outputs
**none**
# awgrover/x-midi/example-control-change
Real simple examples
## Inputs
**none**
## Outputs
**none**
# awgrover/x-midi/example-program-change

## Inputs
**none**
## Outputs
**none**
# awgrover/x-midi/note
Start/stop a note.
## Inputs
> **No. : number (60).**
> Note number

> **Ch : number (1).**
> MIDI Channel

> **VelOn : number (64).**
> Velocity Level (on). often volume, depends on the instrument

> **VelOff : number.**
> some instruments respond to off-velocity, or have decay. Normally 0

> **play : pulse.**
> Send NoteOn when triggered

> **stop : pulse.**
> Send NoteOff when triggered

## Outputs
**none**
# awgrover/x-midi/note-button
A button starts the note (push) and stops on release. Uses xod/common-hardware/button
## Inputs
> **port : number (10).**
> pin for button

> **No. : number (60).**
> Note Number

> **Ch : number (1).**
> MIDI Channel

> **VelOn : number (64).**
> Velocity Level (on). Often volume, depends on the instrument

> **VelOff : number.**
> some instruments respond to off-velocity, or have decay. Normally 0

## Outputs
**none**
# awgrover/x-midi/program-change
Set the inputs, send on pulse ("send")
## Inputs
> **Prg# : number (1).**
> Program Change Number

> **Ch : number (1).**
> MIDI Channel

> **send : pulse.**
> Send when triggered

## Outputs
> **sent : pulse.**
> Pulse when sent

