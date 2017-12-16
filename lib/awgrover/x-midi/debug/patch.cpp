{{#global}}
#include <MIDI.h>
namespace xod {
namespace awgrover__x_midi {
  #ifndef MIDI47_DEFAULT_INSTANCE
    // create one 'MIDI' object only once
    #define MIDI47_DEFAULT_INSTANCE
    bool MIDI_DefaultInited=0; // control setup once

    struct DebugSettings : public midi::DefaultSettings {
        static const long BaudRate = 115200;
    };
    MIDI_CREATE_CUSTOM_INSTANCE(HardwareSerial, Serial, MIDI, DebugSettings);

    void midi_setup() {
      // this should be in setup
      // ( call as xod::awgrover__x_midi::midi_setup(); in evaluate)
      if (!MIDI_DefaultInited) {
        MIDI.begin(MIDI_CHANNEL_OMNI); // Enable Soft Thru, everything at the input is sent back
        DEBUG_SERIAL.print(millis());DEBUG_SERIAL.println(F(" MIDI.begin 115200"));
        MIDI_DefaultInited = 1;
      }
    }
  #endif
}}
{{/global}}


struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    xod::awgrover__x_midi::midi_setup();
    DEBUG_SERIAL.println(F("Config MIDI fired"));
}
