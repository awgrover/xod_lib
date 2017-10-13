# awg/conversions/data-to-pulse
Convert anything into a pulse
## Inputs
> **data : string.**
> Actually takes any

## Outputs
> **pulse : pulse.**

# awg/conversions/true-to-pulse
Convert (each) true into a pulse. Compare with cast-boolean-to-pulse
## Inputs
> **bool : boolean.**
> boolean, or Number (0=false, everything else is true)

## Outputs
> **pulse : pulse.**

# awg/count/count
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

# awg/count/limited-counter
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

# awg/count/simple
Simplified count: 0 to 1 by INC. Then repeat. Default is 256 steps suitable for LEDs etc. aka sawtooth.
## Inputs
> **STEP : number (0.256).**

> **INC : pulse.**

## Outputs
**none**
# awg/count/steps
counts from 0 to LIMIT in N steps. e.g. 0..1000 in 255 steps. sawtooth.
## Inputs
> **LIMIT : number (1).**

> **STEPS : number (255).**

> **INC : pulse.**

## Outputs
> **COUNT : number.**

# awg/hardware/digital-input
Reads digital signal value from board ADC port. Can set input-pullup.
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

# awg/logical/if-else-string
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

# awg/logical/string-compare
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

# awg/util/clock-per-second
Produce n ticks/sec. aka Hz
## Inputs
> **Hz : number (1).**
> ticks/second

> **RST : pulse.**
> Resets clock. Hz starts from 'now'. e.g. Synchronize.

## Outputs
> **tick : pulse.**

# awg/util/log-data
Output the DATA on the console-log, possibly followed by a space. End-of-line is optional. So you can output more than 1 thing per line.
## Inputs
> **data : string.**

> **space : boolean (1).**
> Puts a space after DATA

> **EOL : boolean.**

## Outputs
> **chain : pulse.**
> pulses on output to chain these

# awg/util/timestamp
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
# awg/values/boolean
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

# awg/values/number
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

# awg/values/text
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

