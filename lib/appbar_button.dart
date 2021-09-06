import 'package:flutter/material.dart';
import 'appbar_choice.dart';

class AppBarButton extends StatefulWidget {
  AppBarButton({
    Key? key,
    required this.id,
    required this.caption,
    required this.choiceCallback,
    required this.chosenId,
  }) : super(key: key);

  final AppBarChoise id;
  final String caption;
  final ChoiceCallback choiceCallback;
  final AppBarChoise chosenId;

  @override
  _AppBarButtonState createState() =>
      _AppBarButtonState(id, caption, choiceCallback, chosenId);
}

class _AppBarButtonState extends State<AppBarButton> {
  AppBarChoise id;
  String caption;
  ChoiceCallback choiceCallback;
  AppBarChoise chosenId;

  _AppBarButtonState(this.id, this.caption, this.choiceCallback, this.chosenId);

  Color _activeColor() =>
      widget.chosenId == id ? Colors.orange : Colors.black12;

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
