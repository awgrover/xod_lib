

node {
    //#include <Arduino.h>
    void evaluate(Context ctx) {
        Number bits = getValue<input_BITS>(ctx);
        #ifdef ARDUINO_ARCH_SAMD
        analogWriteResolution(bits);
        emitValue<output_READY>(ctx, true);
        #else
        raiseError<output_READY>(Context ctx)
        #endif
    }
}
