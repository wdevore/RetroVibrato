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
  final Field name = Field.noRange("", "Name");
  final Field sfxrFile = Field.noRange("", "Sfxr File");
  final Field waveFile = Field.noRange("", "Wave File");
  final Field destEmail = Field.noRange("", "Destination Email");
  final Field autoplay = Field.noRange(true, "Auto Play");
  final Field sampleRate = Field.noRange(SampleRate.KHz44, "Sample Rate");
  final Field sampleSize = Field.noRange(8, "Sample Size");
  final Field volume = Field.noRange(0.5, "Auto Play");
  final Field generator = Field.noRange(Generator.None, "None");
  final Field wave = Field.noRange(WaveForm.None, "None");
}

class SettingsModel {
  final appSettings = AppSettings();
  final frequencySettings = FrequencySettings();
  final vibratoSettings = VibratoSettings();
  final arpeggiationSettings = ArpeggiationSettings();
  final dutyCycleSettings = DutyCycleSettings();
  final retriggerSettings = RetriggerSettings();
  final flangerSettings = FlangerSettings();
  final lowPassFilterSettings = LowPassFilterSettings();
  final highPassFilterSettings = HighPassFilterSettings();
  final envelopeSettings = EnvelopeSettings();

  void fromJson(String json) {
    var jSettings = jsonDecode(json);

    appSettings.name.value = jSettings["Name"];
    appSettings.generator.value = _categoryToGenerator(jSettings["Category"]);
    appSettings.wave.value = _waveToGenerator(jSettings["WaveShape"]);
    appSettings.sampleRate.value = jSettings["SampleRate"];
    appSettings.sampleSize.value = jSettings["SampleSize"];
    appSettings.volume.value = jSettings["SoundVolume"];

    // Frequency
    frequencySettings.frequency.value = jSettings["BaseFrequency"];
    frequencySettings.minCutoff.value = jSettings["FrequencyLimit"];
    frequencySettings.slide.value = jSettings["FrequencyRamp"];
    frequencySettings.deltaSlide.value = jSettings["FrequencyDeltaRamp"];

    // Vibrator
    vibratoSettings.depth.value = jSettings["VibratoStrength"];
    vibratoSettings.speed.value = jSettings["VibratoSpeed"];

    // Arpeggiation
    arpeggiationSettings.multiplier.value = jSettings["ArpeggioMod"];
    arpeggiationSettings.speed.value = jSettings["ArpeggioSpeed"];

    // DutyCycle
    dutyCycleSettings.dutyCycle.value = jSettings["DutyCycle"];
    dutyCycleSettings.sweep.value = jSettings["DutyCycleRamp"];

    // Retrigger
    retriggerSettings.rate.value = jSettings["RepeatSpeed"];

    // Flanger
    flangerSettings.offset.value = jSettings["FlangerPhaseOffset"];
    flangerSettings.sweep.value = jSettings["FlangerPhaseRamp"];

    // LowPass
    lowPassFilterSettings.cutoffFreq.value =
        jSettings["LowPassFilterFrequency"];
    lowPassFilterSettings.cutoffSweep.value =
        jSettings["LowPassFilterFrequencyRamp"];
    lowPassFilterSettings.resonance.value =
        jSettings["LowPassFilterFrequencyResonance"];

    // HighPass
    highPassFilterSettings.cutoffFreq.value =
        jSettings["HighPassFilterFrequency"];
    highPassFilterSettings.cutoffSweep.value =
        jSettings["HighPassFilterFrequencyRamp"];

    // Envelope
    envelopeSettings.attack.value = jSettings["EnvelopeAttack"];
    envelopeSettings.sustain.value = jSettings["EnvelopeSustain"];
    envelopeSettings.punch.value = jSettings["EnvelopePunch"];
    envelopeSettings.decay.value = jSettings["EnvelopeDecay"];
  }

  Generator _categoryToGenerator(String cat) {
    switch (cat) {
      case "PickUp":
        return Generator.PickUp;
      case "Laser":
        return Generator.Laser;
      case "Explosion":
        return Generator.Explosion;
      case "PowerUp":
        return Generator.PowerUp;
      case "Hit":
        return Generator.Hit;
      case "Blip":
        return Generator.Blip;
      case "Synth":
        return Generator.Synth;
      case "Random":
        return Generator.Random;
      case "Tone":
        return Generator.Tone;
      case "Mutate":
        return Generator.Mutate;
      default:
        return Generator.None;
    }
  }

  WaveForm _waveToGenerator(int wave) {
    switch (wave) {
      case 0:
        return WaveForm.Square;
      case 1:
        return WaveForm.Triangle;
      case 2:
        return WaveForm.Sine;
      case 3:
        return WaveForm.SawtoothFalling;
      case 4:
        return WaveForm.WhiteNoise;
      case 5:
        return WaveForm.PinkNoise;
      case 6:
        return WaveForm.RedNoise; // Brownian/red
      case 7:
        return WaveForm.SawtoothRising;
      default:
        return WaveForm.None;
    }
  }
}
