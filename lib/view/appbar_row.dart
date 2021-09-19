import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/enums.dart';
import 'appbar_generators_button.dart';
import 'appbar_waveforms_button.dart';
import '../model/choice_provider.dart';

class AppBarRow extends StatefulWidget {
  AppBarRow({Key? key}) : super(key: key);

  @override
  _AppBarRowState createState() => _AppBarRowState();
}

class _AppBarRowState extends State<AppBarRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppBarGeneratorsButton(
          id: AppBarChoise.generators,
          caption: 'Generators',
          choiceCallback: _appBarChoise,
          generatorCallback: _generatorSelected,
        ),
        AppBarWaveFormsButton(
          id: AppBarChoise.waveForms,
          caption: 'Waves',
          choiceCallback: _appBarChoise,
          waveFormCallback: _waveFormSelected,
        ),
      ],
    );
  }

  void _appBarChoise(AppBarChoise id) {
    final provider = ChoiceProvider.of(context);

    setState(() {
      provider.buttonModel.id = id;
    });
  }

  void _generatorSelected(Generator? generator) {
    print('Gen: $generator');
  }

  void _waveFormSelected(WaveForm? wave) {
    final provider = ChoiceProvider.of(context);
    setState(() {
      provider.buttonModel.selectedWave = wave ?? WaveForm.None;
    });
  }
}
