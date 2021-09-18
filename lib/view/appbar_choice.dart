enum AppBarChoise { none, generators, waveForms }

enum Generators {
  PickUp,
  Laser,
  Explosion,
  PowerUp,
  Hit,
  Blip,
  Synth,
  Random,
  Tone,
  Mutate,
  None,
}
enum WaveForms {
  Square,
  Triangle,
  Sine,
  SawtoothRising,
  SawtoothFalling,
  WhiteNoise,
  PinkNoise,
  RedNoise,
  None,
}

typedef void ChoiceCallback(AppBarChoise id);
typedef void GeneratorCallback(Generators? generator);
typedef void WaveFormCallback(WaveForms? wave);
