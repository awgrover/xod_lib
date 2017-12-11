// Common stuff when using MIDI. Have to paste it into each patch.cpp

{{#global}}
#include <MIDI.h>
namespace xod {
namespace awg__x_midi {
  #ifndef MIDI47_DEFAULT_INSTANCE
    // create one 'MIDI' object only once
    #define MIDI47_DEFAULT_INSTANCE

    MIDI_CREATE_DEFAULT_INSTANCE(); // MIDI
    bool MIDI_DefaultInited=0; // control setup once

    void midi_setup() {
      // this should be in setup
      // ( call as xod::awg__x_midi::midi_setup(); in evaluate)
      if (!MIDI_DefaultInited) {
        DEBUG_SERIAL.print(millis());DEBUG_SERIAL.print(F(" MIDI.begin()"));
        // this will reset the serial port to 36800 for the midi's serial port
        MIDI.begin(MIDI_CHANNEL_OMNI); // Enable Soft Thru, everything at the input is sent back
        MIDI_DefaultInited = 1;
      }
    }
  #endif
}}
{{/global}}
