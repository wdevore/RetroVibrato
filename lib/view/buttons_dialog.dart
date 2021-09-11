import 'package:flutter/material.dart';

class ButtonsDialog extends StatelessWidget {
  const ButtonsDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      children: [
        SimpleDialogOption(
          onPressed: () {
            // Navigator.pop(context, "Blip");
          },
          child: const Text('Blip'),
        ),
        SimpleDialogOption(
          onPressed: () {
            // Navigator.pop(context, "Explostion");
          },
          child: const Text('Explostion'),
        ),
      ],
      // elevation: 10,
      //backgroundColor: Colors.green,
    );
  }
}
