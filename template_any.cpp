// Edit for reality. Tries to show various parts you might want.

{{#global}}
#include <Servo.h>
{{/global}}

struct State {
    Number sample = NAN;
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    State* state = getState(ctx);
    
    if (isInputDirty<input_byte2>(ctx)) {
        int|uint8_t|float newValue = getValue<input_byte2>(ctx); // number
        emitValue<output_event>(ctx, /* a 'number' int|uint8_t|float */);
        }

    // if (newValue != state->sample) // only emit if state changed

    emitValue<output_event>(ctx, /* a 'number' int|uint8_t|float */);

    state->sample = newValue; // save new state
}

