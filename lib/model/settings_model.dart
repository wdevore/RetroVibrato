import 'dart:convert';

import 'package:retro_vibrato/model/enums.dart';

class Field {
  double min = 0.0;
  double max = 1.0;

  dynamic value = 0;
  dynamic rValue = 0;

  String label = "";

  Field(this.min, this.max, this.value, this.label) {
    rValue = value;
  }
  Field.noRange(this.value, this.label) {
    rValue = value;
  }

  reset() {
    value = rValue;
  }
}

class EnvelopeSettings {
  final String title = "Envelope";
  bool isExpanded = false;
  final Field attack = Field(0.0, 1.0, 0.0, "Attack");
  final Field sustain = Field(0.0, 1.0, 0.0, "Sustain");
  final Field punch = Field(0.0, 1.0, 0.0, "Punch");
  final Field decay = Field(0.0, 1.0, 0.0, "Decay");
}

class FrequencySettings {
  final String title = "Frequency";
  bool isExpanded = false;
  final Field frequency = Field(0.04, 2.0, 0.04, "Frequency");
  final Field minCutoff = Field(0.0, 1.0, 0.0, "MinCutoff");
  final Field slide = Field(-1.0, 1.0, 0.0, "Slide");
  final Field deltaSlide = Field(-1.0, 1.0, 0.0, "DeltaSlide");
}

class VibratoSettings {
  final String title = "Vibrato";
  bool isExpanded = false;
  final Field depth = Field(0.0, 1.0, 0.0, "Depth");
  final Field speed = Field(0.0, 1.0, 0.0, "Speed");
}

class ArpeggiationSettings {
  final String title = "Arpeggiation";
  bool isExpanded = false;
  final Field multiplier = Field(-1.0, 1.0, 0.0, "Multiplier");
  final Field speed = Field(0.0, 1.0, 0.0, "Speed");
}

class DutyCycleSettings {
  final String title = "DutyCycle";
  bool isExpanded = false;
  final Field dutyCycle = Field(0.0, 1.0, 0.0, "DutyCycle");
  final Field sweep = Field(-1.0, 1.0, 0.0, "Sweep");
}

class RetriggerSettings {
  final String title = "Retrigger";
  bool isExpanded = false;
  final Field rate = Field(0.0, 0.96, 0.0, "Rate");
}

class FlangerSettings {
  final String title = "Flanger";
  bool isExpanded = false;
  final Field offset = Field(-1.0, 1.0, 0.0, "Offset");
  final Field sweep = Field(-1.0, 1.0, 0.0, "Sweep");
}

class LowPassFilterSettings {
  final String title = "LowPass Filter";
  bool isExpanded = false;
  final Field cutoffFreq = Field(0.0, 1.0, 0.0, "CutoffFreq");
  final Field cutoffSweep = Field(-1.0, 1.0, 0.0, "CutoffSweep");
  final Field resonance = Field(0.035, 1.0, 0.035, "Resonance");
}

class HighPassFilterSettings {
  final String title = "HighPass Filter";
  bool isExpanded = false;
  final Field cutoffFreq = Field(0.0, 1.0, 0.0, "CutoffFreq");
  final Field cutoffSweep = Field(-1.0, 1.0, 0.0, "CutoffSweep");
}

class AppSettings {
  final Field sfxrFile = Field.noRange("", "Sfxr File");
  final Field waveFile = Field.noRange("", "Wave File");
  final Field destEmail = Field.noRange("", "Destination Email");
  final Field autoplay = Field.noRange(true, "Auto Play");
  final Field sampleRate = Field.noRange(SampleRate.KHz44, "Auto Play");
  final Field volume = Field.noRange(0.5, "Auto Play");
}

class SettingsModel {
  final appSettings = AppSettings();
  final envelopeSettings = EnvelopeSettings();
  final frequencySettings = FrequencySettings();
  final vibratoSettings = VibratoSettings();
  final arpeggiationSettings = ArpeggiationSettings();
  final dutyCycleSettings = DutyCycleSettings();
  final retriggerSettings = RetriggerSettings();
  final flangerSettings = FlangerSettings();
  final lowPassFilterSettings = LowPassFilterSettings();
  final highPassFilterSettings = HighPassFilterSettings();

  void fromJson(String json) {
    var jSettings = jsonDecode(json);

    // Frequency
    frequencySettings.frequency.value = jSettings["BaseFrequency"];
    frequencySettings.minCutoff.value = jSettings["FrequencyLimit"];
    frequencySettings.slide.value = jSettings["FrequencyRamp"];
    frequencySettings.deltaSlide.value = jSettings["FrequencyDeltaRamp"];
  }
}
