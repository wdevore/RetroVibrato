import 'package:flutter/material.dart';
import 'package:retro_vibrato/view/choice_provider.dart';
import 'appbar_choice.dart';

class AppBarButton extends StatefulWidget {
  AppBarButton({
    Key? key,
    required this.id,
    required this.caption,
    required this.choiceCallback,
  }) : super(key: key);

  final AppBarChoise id;
  final String caption;
  final ChoiceCallback choiceCallback;

  @override
  _AppBarButtonState createState() =>
      _AppBarButtonState(id, caption, choiceCallback);
}

class _AppBarButtonState extends State<AppBarButton> {
  AppBarChoise id;
  String caption;
  ChoiceCallback choiceCallback;

  _AppBarButtonState(this.id, this.caption, this.choiceCallback);

  Color _activeColor() {
    final provider = ChoiceProvider.of(context);
    return provider.buttonModel.id == id ? Colors.orange : Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        choiceCallback(id);
      },
      child: Text(caption),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(left: 10, right: 10),
        primary: Colors.white,
        backgroundColor: _activeColor(),
      ),
    );
  }
}
