{{#global}}
#include <MIDI.h>
namespace xod {
namespace awgrover__midi {
  #ifndef MIDI47_DEFAULT_INSTANCE
    // create one 'MIDI' object only once
    #define MIDI47_DEFAULT_INSTANCE
    bool MIDI_DefaultInited=0; // control setup once

    MIDI_CREATE_DEFAULT_INSTANCE(); // MIDI

    #define DEBUG_SendText(body) /* nothing, see the "debug" node */

    void midi_setup() {
      // this should be in setup
      // ( call as xod::awgrover__midi::midi_setup(); in evaluate)
      if (!MIDI_DefaultInited) {
        // this will reset the serial port to 31250 for the midi's serial port
        MIDI.begin(MIDI_CHANNEL_OMNI); // Enable Soft Thru, everything at the input is sent back
        MIDI_DefaultInited = 1;
        DEBUG_SendText( Serial.print(millis());Serial.print(F(" MIDI.begin()")); )
      }
    }
  #endif
}}
{{/global}}

struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
     xod::awgrover__midi::midi_setup();
    
    if (isInputDirty<input_send>(ctx)) {
        auto channel = getValue<input_Ch>(ctx);
        auto program_number = getValue<input_Ch>(ctx);
      	xod::awgrover__midi::MIDI.sendProgramChange(program_number, channel);
        emitValue<output_sent>(ctx,1);
        // only if xod "Debugger" is on
        DEBUG_SendText(
          Serial.print(millis());Serial.print(F(" "));
          Serial.print(F("Sent progchg/"));Serial.println(channel);
          Serial.print(F(" "));Serial.println(program_number);
        )
    }
}
