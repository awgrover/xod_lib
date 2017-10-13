// Converted from the patch /home/awgrover/xod/play1/log-fragment/patch.xodp

{{#global}}
{{/global}}

struct State {
};

{{ GENERATED_CODE }}

const char Space = ' '; // use less ram across multiple instances
bool Began = false;

void evaluate(Context ctx) {
    
    if ( !Began ) { Serial.begin(115200); Began = true; }

    // always write on dirty, even if same
    if (isInputDirty<input_data>(ctx)) {
      auto data = getValue<input_data>(ctx);
      if (data) {
          for (auto it = data->iterate(); it; ++it)
              Serial.write((char)*it);
      }
      emitValue<output_chain>(ctx, 1);
    }

    if ( (bool) getValue<input_EOL>(ctx) ) {
      Serial.println();
      Serial.flush();
      }

    else if ( (bool) getValue<input_space>(ctx) ) {
      Serial.print(Space);
      }

}

