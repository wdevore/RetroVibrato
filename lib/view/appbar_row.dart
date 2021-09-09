import 'package:flutter/material.dart';
import 'appbar_choice.dart';
import 'appbar_button.dart';
import 'choice_provider.dart';

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
        AppBarButton(
          id: AppBarChoise.generators,
          caption: 'Generators',
          choiceCallback: _appBarChoise,
        ),
        AppBarButton(
          id: AppBarChoise.waveForms,
          caption: 'Wave Forms',
          choiceCallback: _appBarChoise,
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
}
