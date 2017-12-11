struct State {
    int configuredPort = -1;
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    if (!isInputDirty<input_UPD>(ctx))
        return;

    State* state = getState(ctx);
    const int port = (int)getValue<input_PORT>(ctx);
    if (port != state->configuredPort) {
        ::pinMode(port, (bool)getValue<input_PULLUP> ? INPUT_PULLUP : INPUT);
        // Store configured port so to avoid repeating `pinMode` on
        // subsequent requests
        state->configuredPort = port;
    }

    emitValue<output_VAL>(ctx, ::digitalRead(port) );
}
