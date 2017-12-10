{{#global}}
#include <MIDI.h>
{{/global}}

struct State {
};

{{ GENERATED_CODE }}

// create one 'MIDI' object only once
#ifndef MIDI47_DEFAULT_INSTANCE
	MIDI_CREATE_DEFAULT_INSTANCE(); // MIDI
	#define MIDI47_DEFAULT_INSTANCE
	bool MIDI_DefaultInited=0;
#endif

void evaluate(Context ctx) {
    
    // this should be in setup:
    if (!MIDI_DefaultInited) {
        DEBUG_SERIAL.print(millis());DEBUG_SERIAL.print(F(" MIDI.begin()"));
        // this will reset the serial port to 36800 for the midi's serial port
    	MIDI.begin(MIDI_CHANNEL_OMNI); // Enable Soft Thru, everything at the input is sent back
        MIDI_DefaultInited = 1;
	}
    
    auto channel = getValue<input_channel>(ctx);
    auto note = getValue<input_note>(ctx);
    
    if (isInputDirty<input_play>(ctx)) {
        auto on_velocity = getValue<input_on_velocity>(ctx);
    	// note, velocity, channel
    	MIDI.sendNoteOn(note, on_velocity, channel);
        // only if xod "Debugger" is on
        DEBUG_SERIAL.print(millis());DEBUG_SERIAL.print(F(" "));
        DEBUG_SERIAL.print(F("Sent midi-note "));DEBUG_SERIAL.print(note);
        DEBUG_SERIAL.print(F("Vel "));DEBUG_SERIAL.println(on_velocity);	
    }
    else if (isInputDirty<input_stop>(ctx)) {
        auto off_velocity = getValue<input_off_velocity>(ctx);
    	// note, velocity, channel
    	MIDI.sendNoteOff(note, off_velocity, channel);
        // only if xod "Debugger" is on
        DEBUG_SERIAL.print(millis());DEBUG_SERIAL.print(F(" "));
        DEBUG_SERIAL.print(F("Sent midi-note "));DEBUG_SERIAL.print(note);
        DEBUG_SERIAL.print(F("Vel "));DEBUG_SERIAL.print(off_velocity);
        DEBUG_SERIAL.println(F(" off"));
    }

}
