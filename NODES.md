# awgrover/adafruit-mma8451-library-ll/adafruitmma8451
constructor
Default range is supposed ot be 2G, but get-range says 4G.
## Inputs
> **id : number.**
> -1 id default, and usual.
What is it for?

> **alt_addr : boolean.**
> 29 (1Dh) is default and usual address.
Set to true to use alternate  28 (1Ch), and pull `A` pin to ground.

## Outputs
> **adafruitmma8451 : self.**

> **exist : boolean.**
> True if it was detected
False if not detected

> **done : pulse.**
> Pulse if exists and when setup

# awgrover/adafruit-mma8451-library-ll/defer(adafruitmma8451)
Allows to create feedback loops. Repeats a change of the input on the output right after the current transaction will complete.
## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-mma8451-library-ll/equal(adafruitmma8451)
Outputs true if `IN1` = `IN2`, and false otherwise
## Inputs
**none**
## Outputs
> **OUT : boolean.**

# awgrover/adafruit-mma8451-library-ll/example-xyz-orientation

## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-mma8451-library-ll/gate(adafruitmma8451)
Allows values to pass through only if EN pin is set to true
## Inputs
> **EN : boolean.**
> Whether values should pass through

## Outputs
**none**
# awgrover/adafruit-mma8451-library-ll/get-data-rate

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-mma8451-library-ll/get-orientation

## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

# awgrover/adafruit-mma8451-library-ll/get-range
Returns 2,4,8 (G).
(Not the `range` bit values)
## Inputs
> **trigger : pulse.**

## Outputs
> **val : number.**
> 2, 4, or 8 (G)

> **done : pulse.**

# awgrover/adafruit-mma8451-library-ll/if-else(adafruitmma8451)
Outputs either input value depending on condition
## Inputs
> **COND : boolean.**
> Condition value

## Outputs
**none**
# awgrover/adafruit-mma8451-library-ll/range
values for `range` of set-range.
## Inputs
**none**
## Outputs
> **2g : number.**

> **4g : number.**

> **8g : number.**

# awgrover/adafruit-mma8451-library-ll/read-xyz
Get the current xyz as -1..1.
Mapped from -range..range.
cf. `read-xyz-g`
## Inputs
> **trigger : pulse.**

## Outputs
> **x : number.**
> -1..1

> **y : number.**
> -1..1

> **z : number.**
> -1..1

> **done : pulse.**

# awgrover/adafruit-mma8451-library-ll/read-xyz-accel
Get the current xyz in m/sec^2
## Inputs
> **trigger : pulse.**

## Outputs
> **x : number.**
> x in m/s^2

> **y : number.**
> y in m/s^2

> **z : number.**
> z in m/s^2

> **done : pulse.**

# awgrover/adafruit-mma8451-library-ll/read-xyz-g
Get the current xyz in G's
(1 = 9.8m/s^2).
cf. `read-zyz-accel` for 0..1 scale.
## Inputs
> **trigger : pulse.**

## Outputs
> **x : number.**
> x in G units

> **y : number.**
> y in G units

> **z : number.**
> z in G units

> **done : pulse.**

# awgrover/adafruit-mma8451-library-ll/readme

## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-mma8451-library-ll/set-data-rate

## Inputs
> **dataRate : number.**

> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/adafruit-mma8451-library-ll/set-range
set the range 2,4,8 G.
Higher sensitivey at 2G
## Inputs
> **range : number.**

> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/adafruit-neopixel-ll/adafruitneopixel
constructor
https://github.com/adafruit/Adafruit_NeoPixel
Arduino: Adafruit_NeoPixel
XOD: @/input-adafruitneopixel
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
XOD: @/input-adafruitneopixel
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

# awgrover/adafruit-neopixel-ll/black
convenience color: off
## Inputs
**none**
## Outputs
**none**
# awgrover/adafruit-neopixel-ll/brightness
naive brightnes * (r,g,b)
## Inputs
> **brightness : number.**

## Outputs
**none**
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

# awgrover/adafruit-neopixel-ll/color-fade
`val` over the range maps to brightness the color.
## Inputs
> **val : number.**

> **min-v : number.**

> **max-v : number.**

## Outputs
**none**
# awgrover/adafruit-neopixel-ll/color-order
Use  example-rgb-revelation to discover the color-order.
Set one of the 1-x's to true.
Set one of  the 2-x's to true.
The third is deduced.
## Inputs
> **1-red : boolean.**
> Set to true if the 1st color is red

> **1-green : boolean.**
> Set to true if the 1st color is green

> **1-blue : boolean.**
> Set to true if the 1st color is blue

> **2-red : boolean.**
> Set to true if the 2nd color is red

> **2-green : boolean.**
> Set to true if the 2nd color is green

> **2-blue : boolean.**
> Set to true if the 2nd color is blue

## Outputs
> **t : number.**
> color-order-code for the constructor's `t` input

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
# awgrover/adafruit-neopixel-ll/extract-rgb
Get red, green, blue elements of rgb color
## Inputs
**none**
## Outputs
> **red : number.**

> **green : number.**

> **blue : number.**

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
# awgrover/adafruit-neopixel-ll/if-else(rgb-color)
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
# awgrover/adafruit-neopixel-ll/rgb-color
composite rgb+white object
0..1 values
_a rgbw should auto calculate w_
## Inputs
> **red : number.**

> **green : number.**

> **blue : number.**

## Outputs
> **color : self.**

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

# awgrover/adafruit-neopixel-ll/set-pixel-color-rgb

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

# awgrover/analog-write-resolution/analog-write-resolution
Set the bit resolution of the PWM (analogWrite) for SAMD21 and SAMD51 boards. i.e. analogWriteResolution(). Usually  8..16 bits.
## Inputs
> **BITS : number.**
> 8,10,12,14,16 bits, depending on hardware

## Outputs
> **READY : pulse.**
> To signal that the change has been made.
Error if board doesn't support analogWriteResolution()

# awgrover/analog-write-resolution/example-analog-write-resolution
Example showing bit-resolution on an LED.
Read the comments for instructions.
## Inputs
**none**
## Outputs
**none**
# awgrover/buffer1/buffer1
Make a buffer of n bytes.
Only at beginning of program.
Allocates from the heap.
You must check ERR: means not-enough-free-memory
## Inputs
> **bytes : number.**
> size of buffer in bytes

## Outputs
> **buffer1 : self.**

> **done : pulse.**
> did it

> **ERR : pulse.**

# awgrover/buffer1/buffer1x
Make a buffer of n bytes.
Only at beginning of program.
Allocates from the heap.
You must check ERR: means not-enough-free-memory
## Inputs
> **bytes : number.**
> size of buffer in bytes

## Outputs
> **buffer1 : self.**

> **done : pulse.**
> did it

> **ERR : pulse.**

# awgrover/buffer1/debug-dump
Dump the buffer to the console if debugging is on
## Inputs
> **mark : string.**

> **trigger : pulse.**

## Outputs
**none**
# awgrover/buffer1/defer(buffer1)
Allows to create feedback loops. Repeats a change of the input on the output right after the current transaction will complete.
## Inputs
**none**
## Outputs
**none**
# awgrover/buffer1/equal(buffer1)
Outputs true if `IN1` = `IN2`, and false otherwise
## Inputs
**none**
## Outputs
> **OUT : boolean.**

# awgrover/buffer1/example-1

## Inputs
**none**
## Outputs
**none**
# awgrover/buffer1/fill
Fill the entire buffer with a value.
Default fill is 0.
## Inputs
> **value : byte.**
> Fills the buffer with this byte.

> **trigger : pulse.**

## Outputs
> **done : pulse.**

# awgrover/buffer1/gate(buffer1)
Allows values to pass through only if EN pin is set to true
## Inputs
> **EN : boolean.**
> Whether values should pass through

## Outputs
**none**
# awgrover/buffer1/get-byte

## Inputs
> **i : number.**

> **trigger : pulse.**

## Outputs
> **val : byte.**

> **done : pulse.**

> **ERR : pulse.**

# awgrover/buffer1/get-word

## Inputs
> **i : number.**

> **trigger : pulse.**

## Outputs
> **val : number.**

> **done : pulse.**

> **ERR : pulse.**

# awgrover/buffer1/if-else(buffer1)
Outputs either input value depending on condition
## Inputs
> **COND : boolean.**
> Condition value

## Outputs
**none**
# awgrover/buffer1/length

## Inputs
**none**
## Outputs
> **val : number.**

# awgrover/buffer1/set-byte

## Inputs
> **value : byte.**

> **i : number.**

> **trigger : pulse.**

## Outputs
> **done : pulse.**

> **ERR : pulse.**

# awgrover/buffer1/set-word

## Inputs
> **value : number.**

> **i : number.**

> **trigger : pulse.**

## Outputs
> **done : pulse.**

> **ERR : pulse.**

# awgrover/buffer1/tutorial

## Inputs
**none**
## Outputs
**none**
# awgrover/buffer1/tutorial-cpp

## Inputs
**none**
## Outputs
**none**
# awgrover/buffer1/val-pulse-err

## Inputs
> **val : number.**

> **err : pulse.**

## Outputs
> **val-out : number.**

> **done : pulse.**

> **ERR : string.**

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
never implemented.

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
Use xod/hardware/digital-input.

Reads digital signal value from board port. Can set input-pullup.
## Inputs
> **PORT : number.**
> Number of a board digital port to read from

> **PULLUP : boolean.**
> use INPUT_PULLUP, i.e. pin is held high by  a large value resistor (~20k ohm). False is default INPUT behavior

> **UPD : pulse.**
> Triggers new read

## Outputs
> **VAL : number.**
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
> **R : string.**
> Outputs value of `T` if `COND` is true, and `F` otherwise

# awgrover/logical/string-compare
generic equal should work.

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

# awgrover/math/bin
Classify `v` by range
0 if < r1, "0..r1"
1 if >= r1, "r1..r2"
2 if >= r2, etc.
## Inputs
> **v : number.**
> value to bin

> **bin0 : number.**
> The first bin (v < r1 or -inf..r1)  will be this.
Usually just defualt 0.

> **r1 : number.**
> Increasing values for the bins.
nb: v >= r1

## Outputs
> **bin : number.**
> Which r1 is this >= than?

# awgrover/math/bin-decreasing
Bins the input-value:
0 if v < inf, 1 if v < r1, 2 if < r2, etc.
NB: r's are decreasing
## Inputs
> **v : number.**
> value to bin

> **bin0 : number.**
> The first bin (v < inf)  will be this, so v < r1 == this+1

> **r1 : number.**
> Decreasing values for the bins

## Outputs
> **bin : number.**
> Which r1 is this less than?

# awgrover/math/exponential-smooth
Exponential smoothing
The result lags the value, smoothing out
## Inputs
> **n : number.**
>  1/α  where α is the smoothing factor
analogous to `n` samples.
Takes about 3n samples to reach 95% of a stable value.

> **v : number.**
> each value

## Outputs
> **smooth : number.**

# awgrover/math/negate

## Inputs
> ** : number.**

## Outputs
> ** : number.**

# awgrover/math/ratio
Split the value:
a + b = v
## Inputs
> **v : number.**

> **split : number.**
> 0..1

## Outputs
> **a : number.**
> split * v

> **b : number.**
> (1-split) * v : the rest of the value

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

# awgrover/pulse/bit-mask
Set n least-significant bits
## Inputs
> **count : number.**
> number of bits to set,
from least-significant end,
Max is 8

## Outputs
> **bit-mask : byte.**

# awgrover/pulse/example-set-bits

## Inputs
**none**
## Outputs
**none**
# awgrover/pulse/pass-pulses
Block pulses until `EN`
Then `RST` blocks again
## Inputs
> **EN : pulse.**
> Start passing pulses

> **RST : pulse.**
> Stop passing pulses

> **p1 : pulse.**

> **p2 : pulse.**

## Outputs
> **pulse : pulse.**

# awgrover/pulse/pass-strategies
Notes on passing/gating values/pulses/etc.
## Inputs
> ** : number.**

> ** : number.**

> ** : number.**

## Outputs
> ** : pulse.**

> ** : pulse.**

> ** : pulse.**

> ** : number.**

> ** : number.**

> ** : number.**

# awgrover/pulse/set-bits
Set the bit corresponding to a pulse, on the least-significant end.
e.g. p1,p2,p3 would set 00000111
## Inputs
> **x-bits : byte.**
> Intended for internal use, necessary for the variadic behavior.
Should be left as 00h.

> **x-bit-count : number.**
> Intended for internal use, necessary for the variadic behavior.
Should be left as 00h.

> **rst : pulse.**
> Forget pulses,
Output reverts to input (00h).
Next pulses set bits again.

> **p1 : pulse.**
> Sets the corresponding bit, 
from the least-significant-end.
Maximum eight pulse-inputs.

## Outputs
> **bits : byte.**
> The set bits,
Initially 0,
Updated when `bits` changes,
or on `rst`, 
or on one of the pulses.

> **bit-count : number.**
> Number of pulse-inputs, i.e. number of relevant bits.

> **x-rst : pulse.**
> Repeats the `rst`
Necessary for variadic behavior.

# awgrover/pulse/set-lsb
On pulse, set the lsb.
Cf. set-bits
## Inputs
> **bits : byte.**
> Value to modify.

> **set : pulse.**
> Emit the input-value with lsb set,
If input changes later, set its lsb.

> **rst : pulse.**
> Forget the `set` pulse,
Emit the input-value (if it is different from last emitted value)

## Outputs
> **new-bits : byte.**
> Initially a copy of the input,
Only emitted if it would be a changed value.

# awgrover/pulse/wait-all
Wait for all pulses to accumulate.
## Inputs
> **rst : pulse.**

> **_ : pulse.**

> **bits_sofar : byte.**
> start at 0

> **bit_ct_sofar : number.**
> start at 0

> **p1 : pulse.**

## Outputs
> **all : pulse.**

> **bits : byte.**

> **bit_count : number.**

# awgrover/pulse/x-testing-area

## Inputs
**none**
## Outputs
**none**
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
# awgrover/util/write-string

## Inputs
> **SEND : pulse.**
> Triggers write of a string into UART

> **x_err : pulse.**
> for variadic, leave unconnected

> **DATA : string.**
> String to be sent into UART.
Could contain "\r\n" symbols to sent few lines.

## Outputs
> **DONE : pulse.**
> Pulses when all String has been written

> **ERR : pulse.**
> Pulses when something went wrong and all string was not written

# awgrover/values/boolean
Use `buffer` or flip-flop.

On pulse or boolean, copy the boolean out. Set always=false to only copy if the boolean has changed. Acts like casting pulse to boolean
## Inputs
> **boolean : boolean.**
> The boolean to copy

> **pulse : pulse.**
> Also copy on a pulse

> **always : boolean.**
> On pulse or boolean, copy 'boolean'. If false, only copy when 'boolean' changes.

## Outputs
> **copy : boolean.**
> The 'boolean'

> **trig : pulse.**

# awgrover/values/number
use `buffer` and `pulse-on-change`

On pulse or number, copy the number out. Set always=false to only copy if the number has changed. Acts like casting pulse to number
## Inputs
> **number : number.**
> The number to copy

> **pulse : pulse.**
> Also copy on a pulse

> **always : boolean.**
> On pulse or number, copy 'number'. If false, only copy when 'number' changes.

## Outputs
> **copy : number.**
> The 'number'

> **trig : pulse.**

# awgrover/values/text
use `buffer` and `pulse-on-change`


On pulse or text, copy the text out. Set always=false to only copy if the text has changed. Acts like casting pulse to text
## Inputs
> **text : string.**
> The text to copy

> **pulse : pulse.**
> Also copy on a pulse

> **always : boolean.**
> On pulse or text, copy 'text'. If false, only copy when 'text' changes.

## Outputs
> **copy : string.**
> The 'text'

> **trig : pulse.**

