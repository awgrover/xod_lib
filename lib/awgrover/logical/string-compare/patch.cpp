struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    
    // a &| b is dirty, so redo calculation. no need to worry which.
    auto a = getValue<input_a>(ctx);
    auto b = getValue<input_b>(ctx);

    // search till unequal, OR one runs out
    for (auto achar_p = a->iterate(), bchar_p = b->iterate(); achar_p && bchar_p; ++achar_p, ++bchar_p) {
      // test 128 vs. unsigned?
      if (*achar_p > *bchar_p) {
        emitValue<output_greater>(ctx, true);
        return;
        }
      else if (*achar_p < *bchar_p) {
        emitValue<output_less>(ctx, true);
        return;
        }
    }

    // one or both ran out (including 0 length)
    auto alen = a->length();
    auto blen = b->length();
      
    if (alen < blen) {
      emitValue<output_less>(ctx, true);
      }
    else if (alen > blen) {
      emitValue<output_greater>(ctx, true);
      }
    else {
      emitValue<output_eq>(ctx, true);
      }
}

