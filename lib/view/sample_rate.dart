import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/enums.dart';
import 'package:retro_vibrato/model/settings_model.dart';

class SettingsSampleRateSubPanel extends StatefulWidget {
  SettingsSampleRateSubPanel({Key? key, required this.settings})
      : super(key: key);

  final AppSettings settings;

  @override
  _SettingsSampleRateSubPanelsState createState() =>
      _SettingsSampleRateSubPanelsState(settings);
}

class _SettingsSampleRateSubPanelsState
    extends State<SettingsSampleRateSubPanel> {
  final AppSettings settings;
  bool isExpanded = false;

  _SettingsSampleRateSubPanelsState(this.settings);

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: Colors.white,
      animationDuration: Duration(milliseconds: 150),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          this.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.lime.shade200,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Center(
              child: Text(
                "Sample Rate",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            );
          },
          body: Column(
            children: [
              RadioListTile<SampleRate>(
                title: const Text('44 KHz',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    )),
                value: SampleRate.KHz44,
                dense: true,
                groupValue: settings.sampleRate.value,
                onChanged: (SampleRate? value) {
                  setState(() {
                    settings.sampleRate.value = value;
                  });
                },
              ),
              RadioListTile<SampleRate>(
                title: const Text('22 KHz',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    )),
                value: SampleRate.KHz22,
                dense: true,
                groupValue: settings.sampleRate.value,
                onChanged: (SampleRate? value) {
                  setState(() {
                    settings.sampleRate.value = value;
                  });
                },
              ),
              RadioListTile<SampleRate>(
                title: const Text('11 KHz',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    )),
                value: SampleRate.KHz11,
                dense: true,
                groupValue: settings.sampleRate.value,
                onChanged: (SampleRate? value) {
                  setState(() {
                    settings.sampleRate.value = value;
                  });
                },
              ),
              RadioListTile<SampleRate>(
                title: const Text('5.5 KHz',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    )),
                value: SampleRate.KHz55,
                dense: true,
                groupValue: settings.sampleRate.value,
                onChanged: (SampleRate? value) {
                  setState(() {
                    settings.sampleRate.value = value;
                  });
                },
              )
            ],
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
