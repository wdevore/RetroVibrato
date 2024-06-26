import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/choice_provider.dart';
import 'package:retro_vibrato/model/enums.dart';
import 'appbar_choice.dart';

class AppBarGeneratorsButton extends StatefulWidget {
  AppBarGeneratorsButton({
    Key? key,
    required this.id,
    required this.caption,
    required this.choiceCallback,
    required this.generatorCallback,
  }) : super(key: key);

  final AppBarChoise id;
  final String caption;
  final ChoiceCallback choiceCallback;
  final GeneratorCallback generatorCallback;

  @override
  _AppBarGeneratorsButtonState createState() => _AppBarGeneratorsButtonState(
        id,
        caption,
        choiceCallback,
        generatorCallback,
      );
}

class _AppBarGeneratorsButtonState extends State<AppBarGeneratorsButton> {
  AppBarChoise id;
  String caption;
  ChoiceCallback choiceCallback;
  GeneratorCallback generatorCallback;

  Generator? _generatorsSelected = Generator.Tone;

  _AppBarGeneratorsButtonState(
    this.id,
    this.caption,
    this.choiceCallback,
    this.generatorCallback,
  );

  Color _activeColor() {
    final provider = ChoiceProvider.of(context);
    return provider.buttonModel.id == id ? Colors.orange : Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        choiceCallback(id);
        _displayDialog(context);
      },
      child: Text(caption),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(left: 10, right: 10),
        foregroundColor: Colors.white,
        backgroundColor: _activeColor(),
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    _generatorsSelected = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: SimpleDialog(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Touch Generator',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.PickUp);
                },
                child: const Text(
                  'PickUp/Coin',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.Laser);
                },
                child: const Text(
                  'Laser/Shoot',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.Explosion);
                },
                child: const Text(
                  'Explosion',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.PowerUp);
                },
                child: const Text(
                  'PowerUp',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.Hit);
                },
                child: const Text(
                  'Hit/Hurt',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.Blip);
                },
                child: const Text(
                  'Blip/Select',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.Synth);
                },
                child: const Text(
                  'Synth',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.Random);
                },
                child: const Text(
                  'Random',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.Tone);
                },
                child: const Text(
                  'Tone',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  generatorCallback(Generator.Mutate);
                },
                child: const Text(
                  'Mutate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                child: Text('Done'),
                onPressed: () {
                  Navigator.pop(context, null);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.black45,
                ),
              ),
            ],
            backgroundColor: Colors.black45,
          ),
        );
      },
    );

    if (_generatorsSelected != null) {
      generatorCallback(_generatorsSelected);
    }
  }
}
