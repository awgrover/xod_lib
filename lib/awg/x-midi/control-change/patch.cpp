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
    
    
    if (isInputDirty<input_send>(ctx)) {
        auto channel = getValue<input_channel>(ctx);
        auto controller_number = getValue<input_controller_number>(ctx);
        auto control_value = getValue<input_control_value>(ctx);
    	// note, velocity, channel
    	MIDI.sendControlChange(controller_number, control_value, channel);
        // only if xod "Debugger" is on
        DEBUG_SERIAL.print(millis());DEBUG_SERIAL.print(F(" "));
        DEBUG_SERIAL.print(F("Sent CC "));
        DEBUG_SERIAL.print(F("# "));DEBUG_SERIAL.println(controller_number);
        DEBUG_SERIAL.print(F("V "));DEBUG_SERIAL.println(control_value);
    }
}
