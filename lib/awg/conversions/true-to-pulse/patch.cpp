struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    
  if (getValue<input_bool>(ctx)) {
    emitValue<output_pulse>(ctx, 1);
    }
}

