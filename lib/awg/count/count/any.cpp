
struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    Number count; 

    if (isInputDirty<input_RST>(ctx)) {
        count = getValue<input_START>(ctx) ;

    } else {

      Number start = getValue<input_START>(ctx);
      Number limit = getValue<input_LIMIT>(ctx);
      count = getValue<output_COUNT>(ctx);

      if (isInputDirty<input_INC>(ctx)) {
          if (start <= limit) {
            // step is an abs() change, in whatever direction
            count += abs( getValue<input_STEP>(ctx) );
          } else {
            count -= abs( getValue<input_STEP>(ctx) );
          }
          
          // fall through and check limit
      }

      // and, START, STEP, LIMIT may have changed, so also have to check limit
      // nb. If START changes, and count < start, then it will be out of range for a while!
      if ( (start <= limit && count > limit)
            || count < limit ) {
          count = start;
      }
    }

    emitValue<output_COUNT>(ctx, count);
}
