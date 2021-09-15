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
  bool expanded = false;
  double depth = 0.0;
  double speed = 0.0;
}

class ArpeggiationSettings {
  bool expanded = false;
  double multiplier = 0.0;
  double speed = 0.0;
}

class DutyCycleSettings {
  bool expanded = false;
  double dutyCycle = 0.0;
  double sweep = 0.0;
}

class RetriggerSettings {
  bool expanded = false;
  double rate = 0.0;
}

class FlangerSettings {
  bool expanded = false;
  double offset = 0.0;
  double sweep = 0.0;
}

class LowPassFilterSettings {
  bool expanded = false;
  double cutoffFreq = 0.0;
  double cutoffSweep = 0.0;
  double resonance = 0.0;
}

class HighPassFilterSettings {
  bool expanded = false;
  double cutoffFreq = 0.0;
  double cutoffSweep = 0.0;
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
