// Converted from the patch /home/awgrover/xod/play1/logging/patch.xodp

{{#global}}
//#include <Servo.h>
{{/global}}

struct State {
    // Number sample = NAN;
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    // State* state = getState(ctx);
    
    if (isInputDirty<input_PULSE>(ctx)) {
        // pulse. unwrap the 'if' for implicit "is dirty this pulse"
        /* Do Something */
        }

    if (isInputDirty<input_ALWAYS>(ctx)) {
        auto newValue = getValue<input_ALWAYS>(ctx); // boolean
        /* Do Something */
        }

    if (isInputDirty<input_TEXT>(ctx)) {
        auto newValue = getValue<input_TEXT>(ctx); // string
        /* Do Something */
        }


    // if (newValue != state->sample) // only emit if state changed
    // if (getValue<output_OUT>(ctx) != state->sample) // only emit if state changed

    /* Do Something because at least one person was dirty */

    state->sample = newValue; // save new state
}

