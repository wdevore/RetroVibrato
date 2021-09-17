class Field {
  double min = 0.0;
  double max = 1.0;
  double value = 0.0;
  String label = "";
  Field(this.min, this.max, this.value, this.label);
}

class EnvelopeSettings {
  final String title = "Envelope";
  bool isExpanded = false;
  final Field attack = Field(0.0, 1.0, 0.75, "Attack");
  final Field sustain = Field(0.0, 1.0, 0.5, "Sustain");
  final Field punch = Field(0.0, 1.0, 0.25, "Punch");
  final Field decay = Field(0.0, 1.0, 0.0, "Decay");
}

class FrequencySettings {
  final String title = "Frequency";
  bool isExpanded = false;
  final Field frequency = Field(0.0, 1.0, 0.75, "Frequency");
  final Field minCutoff = Field(0.0, 1.0, 0.5, "MinCutoff");
  final Field slide = Field(0.0, 1.0, 0.25, "Slide");
  final Field deltaSlide = Field(0.0, 1.0, 0.0, "DeltaSlide");
}

class VibratoSettings {
  final String title = "Vibrato";
  bool isExpanded = false;
  final Field depth = Field(0.0, 1.0, 0.25, "Depth");
  final Field speed = Field(0.0, 1.0, 0.0, "Speed");
}

class ArpeggiationSettings {
  final String title = "Arpeggiation";
  bool isExpanded = false;
  final Field multiplier = Field(0.0, 1.0, 0.25, "Multiplier");
  final Field speed = Field(0.0, 1.0, 0.25, "Speed");
}

class DutyCycleSettings {
  final String title = "DutyCycle";
  bool isExpanded = false;
  final Field dutyCycle = Field(0.0, 1.0, 0.25, "DutyCycle");
  final Field sweep = Field(0.0, 1.0, 0.25, "Sweep");
}

class RetriggerSettings {
  final String title = "Retrigger";
  bool isExpanded = false;
  final Field rate = Field(0.0, 1.0, 0.25, "Rate");
}

class FlangerSettings {
  final String title = "Flanger";
  bool isExpanded = false;
  final Field offset = Field(0.0, 1.0, 0.25, "Offset");
  final Field sweep = Field(0.0, 1.0, 0.25, "Sweep");
}

class LowPassFilterSettings {
  final String title = "LowPass Filter";
  bool isExpanded = false;
  final Field cutoffFreq = Field(0.0, 1.0, 0.25, "CutoffFreq");
  final Field cutoffSweep = Field(0.0, 1.0, 0.25, "CutoffSweep");
  final Field resonance = Field(0.0, 1.0, 0.25, "Resonance");
}

class HighPassFilterSettings {
  final String title = "HighPass Filter";
  bool isExpanded = false;
  final Field cutoffFreq = Field(0.0, 1.0, 0.25, "CutoffFreq");
  final Field cutoffSweep = Field(0.0, 1.0, 0.25, "CutoffSweep");
}

class SettingsModel {
  final envelopeSettings = EnvelopeSettings();
  final frequencySettings = FrequencySettings();
  final vibratoSettings = VibratoSettings();
  final arpeggiationSettings = ArpeggiationSettings();
  final dutyCycleSettings = DutyCycleSettings();
  final retriggerSettings = RetriggerSettings();
  final flangerSettings = FlangerSettings();
  final lowPassFilterSettings = LowPassFilterSettings();
  final highPassFilterSettings = HighPassFilterSettings();

  void setV(double value, int field) {
    switch (field) {
      case 0:
        envelopeSettings.attack.value = value;
        break;
      case 1:
        envelopeSettings.sustain.value = value;
        break;
      case 2:
        envelopeSettings.punch.value = value;
        break;
      case 3:
        envelopeSettings.decay.value = value;
        break;
    }
  }

  double getV(int field) {
    switch (field) {
      case 0:
        return envelopeSettings.attack.value;
      case 1:
        return envelopeSettings.sustain.value;
      case 2:
        return envelopeSettings.punch.value;
      case 3:
        return envelopeSettings.decay.value;
      default:
        return 0.0;
    }
  }
}
