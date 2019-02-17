
struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    if (! isInputDirty<input_v>(ctx)) return; // only update on v
        
    auto n = getValue<input_n>(ctx);
    auto v = getValue<input_v>(ctx);
    
    auto sofar = getValue<output_smooth>(ctx); // instead of using state

    // update
    Number smooth = v/n + (sofar - sofar/n); // simplified from v/n + ((n-1) * sofar)/n;
    
    emitValue<output_smooth>(ctx, smooth);
}
