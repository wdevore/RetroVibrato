import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/button_id.dart';

class ChoiceProvider extends InheritedWidget {
  final buttonModel = ButtonId();

  ChoiceProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) =>
      buttonModel.id != (oldWidget as ChoiceProvider).buttonModel.id;

  static ChoiceProvider of(BuildContext context) {
    final ChoiceProvider? provider =
        context.dependOnInheritedWidgetOfExactType<ChoiceProvider>();

    assert(provider != null, 'No Choice provider found in context');

    return provider!;
  }
}
