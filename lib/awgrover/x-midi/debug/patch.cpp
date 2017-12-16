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

    #define DEBUG_SendText(body) /* DEBUG_SendText( Serial.print.....; ... ) */ \
      { \
      /* It's a hack! universal system-exclusive 0x7E:0x00 "unused" */ \
      Serial.write(0xf0); Serial.write(0x7E); Serial.write(0x00); \
      body \
      Serial.write(0xF7); \
      }

    void midi_setup() {
      // this should be in setup
      // ( call as xod::awgrover__x_midi::midi_setup(); in evaluate)
      if (!MIDI_DefaultInited) {
        MIDI.begin(MIDI_CHANNEL_OMNI); // Enable Soft Thru, everything at the input is sent back
        MIDI_DefaultInited = 1;
        DEBUG_SendText( Serial.print(millis());Serial.println(F(" MIDI.begin 115200")); )
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
    DEBUG_SendText( Serial.println(F("Config MIDI fired")); )
}
