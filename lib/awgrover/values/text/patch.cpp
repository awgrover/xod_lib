struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    // the 'text' version is the prototype,
    // we derive boolean/number by assuming that input vars in here are 'auto'
    // and the name is "_text".
    boolean always = getValue<input_always>(ctx); // always emit, or only on change?

    if (isInputDirty<input_text>(ctx)) {
      auto newvalue = getValue<input_text>(ctx);
      // emit always || (input_text changed)
      if ( always || (newvalue != getValue<output_copy>(ctx)) ) {
        emitValue<output_copy>(ctx, newvalue);
        emitValue<output_trig>(ctx, 1);
        }
      }
    else {
      auto newvalue = getValue<output_copy>(ctx);
      // emit based on always (text didn't change, but always might have)
      if (always) {
        emitValue<output_copy>(ctx, newvalue);
        emitValue<output_trig>(ctx, 1);
        }
      }

}

