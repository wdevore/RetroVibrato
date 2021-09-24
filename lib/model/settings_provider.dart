import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/settings_model.dart';

class SettingsProvider extends InheritedWidget {
  final settingsModel = SettingsModel();

  SettingsProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => this != oldWidget;

  static SettingsProvider of(BuildContext context) {
    final SettingsProvider? provider =
        context.dependOnInheritedWidgetOfExactType<SettingsProvider>();

    assert(provider != null, 'No Settings provider found in context');

    return provider!;
  }
}
