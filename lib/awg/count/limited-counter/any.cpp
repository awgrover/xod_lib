struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    // NB: the last STEP may be smaller than you expect: 1..10 STEP 4 will look like this:
    //    1,5,9,10
    //    We always "pin" to the MAX, rather than trying to stop-before-exceeding-it.
    // First output behavior is interesting:
    //  By default, the node is "RST = on boot":
    //    On startup, all inputs are marked as dirty, so that will fire RST on the first time
    //    and emit MIN (because RST forces ignoring all other inputs, so no INC)
    //    So, you'll get your MIN (usually 0)
    //    (or MAX if STEP is <0)
    //  However, if you set "RST = never"
    //    On startup, RST won't "fire"
    //    So, what OUT will be depends on INC:
    //      If INC gets a pulse during "first transaction", then it will increment the OUT
    //      and you'll never see MIN.
    //      NB: "first transaction" is effectively at time == 1 second.
    //      Thus, a clock fires the first time at 0, so we would see INC=pulse, RST=nothing
    //      and out = MIN + STEP the first time
    //      And, keep in mind that most nodes will output on first transaction,
    //        though input pulses usually are set to not act like triggered on first
    //      And, If INC doesn't get a pulse, then OUT just has the initial-default (usually MIN)
    //        and so "downstream" nodes see that (if they fire).
    // Be conservative on emitting: "is there a change?"
    //  Only add the STEP on INC pulse.
    //  If only STEP is dirty, we do not emit.
    //  Won't emit if only MIN/MAX is changed _and_ out is still between them
    //    but will emit if out needs to be changed to keep within
    //  Won't emit if step == 0 on INC pulse
    //  RST won't emit if already at MIN (or MAX if decrementing)

    Number max = getValue<input_MAX>(ctx); // number
    Number min = getValue<input_MIN>(ctx); // number
    Number out;

    //Serial.print("! ");

    if (isInputDirty<input_RST>(ctx)) {
      //Serial.print("RST ");
        // RST means "go to beginning" which depends on direction:
        // (and ignore INC)

        if ( getValue<input_STEP>(ctx) < 0 ) out = max;
        else out = min;
        //Serial.print("=");Serial.print(out*1000);Serial.print(" ");

        }
    
    else {

      // (if only STEP is dirty, it will fall through all this and not emit)

      if ( isInputDirty<input_INC>(ctx) ) {
          Number step = getValue<input_STEP>(ctx);
          //Serial.print("INC ");Serial.print(step*1000.0);Serial.print(" ");

          // won't emit if step==0
          if (step != 0) {
            out = getValue<output_OUT>(ctx) + step;
            }
          else {
            // all code paths need to set "out"
            out = getValue<output_OUT>(ctx);
            }

          //Serial.print("=");Serial.print(out*1000);Serial.print(" ");
          }

        else {
          // all code paths need to set "out"
          //Serial.print("!INC ");
          out = getValue<output_OUT>(ctx);
          //Serial.print("=");Serial.print(out*1000);Serial.print(" ");
          }

        // Pin the number from MIN..MAX inclusive
        // May need to do this on an INC, on a MAX/MIN change
        // Won't emit if only MIN/MAX is changed _and_ out is still between
        if ( out < min ) {
          out = min;
          //Serial.print(" pin<");Serial.print(out*1000);Serial.print(" ");
          }
        else if (out > max) {
          out = max;
          //Serial.print(" pin>");Serial.print(out*1000);Serial.print(" ");
          }

      }

    Number was = getValue<output_OUT>(ctx);
    //if ( was != out) { Serial.print(" emit=");Serial.println(out*1000); }
    //else Serial.println("==");
    if ( was != out) emitValue<output_OUT>(ctx, out);

}
