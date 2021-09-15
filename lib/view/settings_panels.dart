import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/settings_model.dart';
import 'package:retro_vibrato/model/settings_provider.dart';
import 'package:retro_vibrato/view/custom_slider_thumb_rect.dart';

class SettingsPanels extends StatefulWidget {
  SettingsPanels({Key? key}) : super(key: key);

  @override
  _SettingsPanelsState createState() => _SettingsPanelsState();
}

class _SettingsPanelsState extends State<SettingsPanels> {
  @override
  Widget build(BuildContext context) {
    final provider = SettingsProvider.of(context);
    SettingsModel data = provider.settingsModel;

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildEnvelopeExpansionPanelList(data.envelopeSettings),
          _buildFrequencyExpansionPanelList(data.frequencySettings),
        ],
      ),
    );
  }

  // Each list has several ExpansionPanels in it
  ExpansionPanelList _buildEnvelopeExpansionPanelList(EnvelopeSettings env) {
    return ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.zero,
        dividerColor: Colors.white,
        animationDuration: Duration(milliseconds: 150),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            env.isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            backgroundColor: Colors.black38,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildTitle(env.title);
            },
            body: Column(
              children: [
                _buildSliderRow(env.attack),
                _buildSliderRow(env.sustain),
                _buildSliderRow(env.punch),
                _buildSliderRow(env.decay),
              ],
            ),
            isExpanded: env.isExpanded,
          ),
        ]);
  }

  ExpansionPanelList _buildFrequencyExpansionPanelList(FrequencySettings env) {
    return ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.zero,
        dividerColor: Colors.white,
        animationDuration: Duration(milliseconds: 150),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            env.isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            backgroundColor: Colors.black38,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildTitle(env.title);
            },
            body: Column(
              children: [
                _buildSliderRow(env.frequency),
                _buildSliderRow(env.minCutoff),
                _buildSliderRow(env.slide),
                _buildSliderRow(env.deltaSlide),
              ],
            ),
            isExpanded: env.isExpanded,
          ),
        ]);
  }

  ListTile _buildTitle(String title) {
    return ListTile(
      isThreeLine: false,
      title: Container(
        alignment: Alignment.center,
        color: Colors.black26,
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }

  Align _buildSliderLabel(String label) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

// ------------------------------------------------------------------
  Container _buildSliderRow(Field data) {
    return Container(
      height: 30,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: _buildSliderLabel(data.label),
          ),
          Expanded(
            flex: 4,
            child: _buildSlider(data),
          ),
        ],
      ),
    );
  }

  SliderTheme _buildSlider(
    Field data,
  ) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.blue[700],
        inactiveTrackColor: Colors.blue[700],
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 5.0,
        thumbColor: Colors.white,
        thumbShape: CustomSliderThumbRect(
          thumbRadius: 15.0,
          thumbHeight: 25,
          min: data.min,
          max: data.max,
          sliderValue: data.value,
        ),
        overlayColor: Colors.blue.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Slider(
        value: data.value,
        min: data.min,
        max: data.max,
        divisions: 200,
        onChanged: (value) {
          setState(() {
            data.value = value;
          });
        },
      ),
    );
  }
}
