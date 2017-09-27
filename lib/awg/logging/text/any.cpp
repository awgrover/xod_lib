struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    boolean always = getValue<input_always>(ctx); // always emit, or only on change?
    XString newvalue; // XString
    boolean should_emit;

    if (isInputDirty<input_text>(ctx)) {
      newvalue = getValue<input_text>(ctx);
      // emit always || (input_text changed)
      should_emit = always || (newvalue != getValue<output_copy>(ctx));
      }
    else {
      newvalue = getValue<output_copy>(ctx);
      // emit based on always (text didn't change, but always might have)
      should_emit = always;
      }

    if (should_emit) {
      emitValue<output_copy>(ctx, newvalue);
      emitValue<output_trig>(ctx, 1);
      }

}

