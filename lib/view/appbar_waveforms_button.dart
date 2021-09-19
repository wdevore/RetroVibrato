import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/choice_provider.dart';
import 'package:retro_vibrato/model/enums.dart';
import 'appbar_choice.dart';

class AppBarWaveFormsButton extends StatefulWidget {
  AppBarWaveFormsButton({
    Key? key,
    required this.id,
    required this.caption,
    required this.choiceCallback,
    required this.waveFormCallback,
  }) : super(key: key);

  final AppBarChoise id;
  final String caption;
  final ChoiceCallback choiceCallback;
  final WaveFormCallback waveFormCallback;

  @override
  _AppBarWaveFormsButtonState createState() => _AppBarWaveFormsButtonState(
        id,
        caption,
        choiceCallback,
        waveFormCallback,
      );
}

class _AppBarWaveFormsButtonState extends State<AppBarWaveFormsButton> {
  AppBarChoise id;
  String caption;
  ChoiceCallback choiceCallback;
  WaveFormCallback waveFormCallback;

  _AppBarWaveFormsButtonState(
    this.id,
    this.caption,
    this.choiceCallback,
    this.waveFormCallback,
  );

  Color _activeColor() {
    final provider = ChoiceProvider.of(context);
    return provider.buttonModel.id == id ? Colors.orange : Colors.black12;
  }

  String _getWave(WaveForm wave) => wave.toString().split('.').last;

  @override
  Widget build(BuildContext context) {
    final provider = ChoiceProvider.of(context);
    final String cap =
        caption + ' (${_getWave(provider.buttonModel.selectedWave)})';

    return TextButton(
      onPressed: () {
        choiceCallback(id);
        _displayDialog(context);
      },
      child: Text(cap),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(left: 10, right: 10),
        primary: Colors.white,
        backgroundColor: _activeColor(),
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    // _waveFormsSelected =
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: SimpleDialog(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Touch Wave Form',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  waveFormCallback(WaveForm.Square);
                },
                child: const Text('Square',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SimpleDialogOption(
                onPressed: () {
                  waveFormCallback(WaveForm.Triangle);
                },
                child: const Text('Triangle',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SimpleDialogOption(
                onPressed: () {
                  waveFormCallback(WaveForm.Sine);
                },
                child: const Text('Sine',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SimpleDialogOption(
                onPressed: () {
                  waveFormCallback(WaveForm.SawtoothRising);
                },
                child: const Text('Sawtooth Rising',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SimpleDialogOption(
                onPressed: () {
                  waveFormCallback(WaveForm.SawtoothFalling);
                },
                child: const Text('Sawtooth Falling',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SimpleDialogOption(
                onPressed: () {
                  waveFormCallback(WaveForm.WhiteNoise);
                },
                child: const Text('WhiteNoise',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SimpleDialogOption(
                onPressed: () {
                  waveFormCallback(WaveForm.PinkNoise);
                },
                child: const Text('PinkNoise',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SimpleDialogOption(
                onPressed: () {
                  waveFormCallback(WaveForm.RedNoise);
                },
                child: const Text(
                  'RedNoise',
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
                  primary: Colors.orange,
                  backgroundColor: Colors.black45,
                ),
              ),
            ],
            backgroundColor: Colors.black45,
          ),
        );
      },
    );

    // if (_waveFormsSelected != null) {
    //   waveFormCallback(_waveFormsSelected);
    // }
  }
}
