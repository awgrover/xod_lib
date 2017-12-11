{{#global}}
#include <MIDI.h>
namespace xod {
namespace awgrover__x_midi {
  #ifndef MIDI47_DEFAULT_INSTANCE
    // create one 'MIDI' object only once
    #define MIDI47_DEFAULT_INSTANCE

    MIDI_CREATE_DEFAULT_INSTANCE(); // MIDI
    bool MIDI_DefaultInited=0; // control setup once

    void midi_setup() {
      // this should be in setup
      // ( call as xod::awgrover__x_midi::midi_setup(); in evaluate)
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

struct State {
};

{{ GENERATED_CODE }}

void evaluate(Context ctx) {
    xod::awgrover__x_midi::midi_setup();
    
    if (isInputDirty<input_send>(ctx)) {
      auto channel = getValue<input_channel>(ctx);
      auto controller_number = getValue<input_controller_number>(ctx);
      auto control_value = getValue<input_control_value>(ctx);
    	// note, velocity, channel
    	xod::awgrover__x_midi::MIDI.sendControlChange(controller_number, control_value, channel);
      emitValue<output_sent>(ctx,1);
      // only if xod "Debugger" is on
      DEBUG_SERIAL.print(millis());DEBUG_SERIAL.print(F(" "));
      DEBUG_SERIAL.print(F("Sent CC "));DEBUG_SERIAL.print(controller_number);
      DEBUG_SERIAL.print(F(" V "));DEBUG_SERIAL.println(control_value);
    }
}
