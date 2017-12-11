struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    
  // anytime we get triggered, i.e. incoming data
  emitValue<output_pulse>(ctx, 1);
}

