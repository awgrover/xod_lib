{{#global}}
#include <MIDI.h>
namespace xod {
namespace awgrover__x_midi {
  #ifndef MIDI47_DEFAULT_INSTANCE
    // create one 'MIDI' object only once
    #define MIDI47_DEFAULT_INSTANCE
    bool MIDI_DefaultInited=0; // control setup once

    MIDI_CREATE_DEFAULT_INSTANCE(); // MIDI

    #define DEBUG_SendText(body) /* nothing, see the "debug" node */

    void midi_setup() {
      // this should be in setup
      // ( call as xod::awgrover__x_midi::midi_setup(); in evaluate)
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
    xod::awgrover__x_midi::midi_setup(); 
    
    auto channel = getValue<input_channel>(ctx);
    auto note = getValue<input_note>(ctx);
    
    if (isInputDirty<input_play>(ctx)) {
        auto on_velocity = getValue<input_on_velocity>(ctx);
    	// note, velocity, channel
    	xod::awgrover__x_midi::MIDI.sendNoteOn(note, on_velocity, channel);
      // only if xod "Debugger" is on
      DEBUG_SERIAL.print(millis());DEBUG_SERIAL.print(F(" "));
      DEBUG_SERIAL.print(F("Sent midi-note "));DEBUG_SERIAL.print(note);
      DEBUG_SERIAL.print(F("Vel "));DEBUG_SERIAL.println(on_velocity);	
    }
    else if (isInputDirty<input_stop>(ctx)) {
        auto off_velocity = getValue<input_off_velocity>(ctx);
    	// note, velocity, channel
    	xod::awgrover__x_midi::MIDI.sendNoteOff(note, off_velocity, channel);
      // only if xod "Debugger" is on
      DEBUG_SERIAL.print(millis());DEBUG_SERIAL.print(F(" "));
      DEBUG_SERIAL.print(F("Sent midi-note "));DEBUG_SERIAL.print(note);
      DEBUG_SERIAL.print(F("Vel "));DEBUG_SERIAL.print(off_velocity);
      DEBUG_SERIAL.println(F(" off"));
    }

}
