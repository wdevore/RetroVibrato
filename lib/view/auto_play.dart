import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/settings_model.dart';

class SettingsAutoplayCheck extends StatefulWidget {
  SettingsAutoplayCheck({Key? key, required this.settings}) : super(key: key);

  final AppSettings settings;

  @override
  _SettingsAutoplayCheckState createState() =>
      _SettingsAutoplayCheckState(settings);
}

class _SettingsAutoplayCheckState extends State<SettingsAutoplayCheck> {
  final AppSettings settings;

  _SettingsAutoplayCheckState(this.settings);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lime.shade300),
      child: CheckboxListTile(
        title: const Text(
          'Auto Play',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        value: settings.autoplay.value,
        onChanged: (bool? value) {
          setState(() {
            settings.autoplay.value = value!;
          });
        },
        secondary: const Icon(
          Icons.play_arrow_outlined,
          size: 30,
        ),
      ),
    );
  }
}
