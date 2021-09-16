import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/settings_model.dart';
import 'package:retro_vibrato/model/settings_provider.dart';
import 'package:retro_vibrato/view/custom_slider_thumb_rect.dart';

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

// ***************************************************************
class SettingsExpansionPanels extends StatelessWidget {
  // This contains all the Panels. Each panels is stateful.
  @override
  Widget build(BuildContext context) {
    final provider = SettingsProvider.of(context);
    SettingsModel data = provider.settingsModel;

    return SingleChildScrollView(
      child: Column(
        children: [
          SettingsEnvelopeSubPanel(settings: data.envelopeSettings),
          SettingsFrequencySubPanel(settings: data.frequencySettings),
          SettingsVibratoSubPanel(settings: data.vibratoSettings),
          SettingsArpeggiationSubPanel(settings: data.arpeggiationSettings),
        ],
      ),
    );
  }
}

class SettingsEnvelopeSubPanel extends StatefulWidget {
  SettingsEnvelopeSubPanel({Key? key, required this.settings})
      : super(key: key);

  final EnvelopeSettings settings;

  @override
  _SettingsEnvelopeSubPanelsState createState() =>
      _SettingsEnvelopeSubPanelsState(settings);
}

class _SettingsEnvelopeSubPanelsState extends State<SettingsEnvelopeSubPanel> {
  final EnvelopeSettings settings;

  _SettingsEnvelopeSubPanelsState(this.settings);

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: Colors.white,
      animationDuration: Duration(milliseconds: 150),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          settings.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.black38,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              _buildSliderRow(settings.attack),
              _buildSliderRow(settings.sustain),
              _buildSliderRow(settings.punch),
              _buildSliderRow(settings.decay),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }

  SliderTheme _buildSlider(Field data) {
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
}

// ##############---------------##############---------------
class SettingsFrequencySubPanel extends StatefulWidget {
  SettingsFrequencySubPanel({Key? key, required this.settings})
      : super(key: key);

  final FrequencySettings settings;

  @override
  _SettingsFrequencySubPanelsState createState() =>
      _SettingsFrequencySubPanelsState(settings);
}

class _SettingsFrequencySubPanelsState
    extends State<SettingsFrequencySubPanel> {
  final FrequencySettings settings;

  _SettingsFrequencySubPanelsState(this.settings);

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: Colors.white,
      animationDuration: Duration(milliseconds: 150),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          settings.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.black38,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              _buildSliderRow(settings.frequency),
              _buildSliderRow(settings.minCutoff),
              _buildSliderRow(settings.slide),
              _buildSliderRow(settings.deltaSlide),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }

  SliderTheme _buildSlider(Field data) {
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
}

// ##############---------------##############---------------
class SettingsVibratoSubPanel extends StatefulWidget {
  SettingsVibratoSubPanel({Key? key, required this.settings}) : super(key: key);

  final VibratoSettings settings;

  @override
  _SettingsVibratoSubPanelsState createState() =>
      _SettingsVibratoSubPanelsState(settings);
}

class _SettingsVibratoSubPanelsState extends State<SettingsVibratoSubPanel> {
  final VibratoSettings settings;

  _SettingsVibratoSubPanelsState(this.settings);

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: Colors.white,
      animationDuration: Duration(milliseconds: 150),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          settings.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.black38,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              _buildSliderRow(settings.depth),
              _buildSliderRow(settings.speed),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }

  SliderTheme _buildSlider(Field data) {
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
}

// ##############---------------##############---------------
class SettingsArpeggiationSubPanel extends StatefulWidget {
  SettingsArpeggiationSubPanel({Key? key, required this.settings})
      : super(key: key);

  final ArpeggiationSettings settings;

  @override
  _SettingsArpeggiationSubPanelsState createState() =>
      _SettingsArpeggiationSubPanelsState(settings);
}

class _SettingsArpeggiationSubPanelsState
    extends State<SettingsArpeggiationSubPanel> {
  final ArpeggiationSettings settings;

  _SettingsArpeggiationSubPanelsState(this.settings);

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: Colors.white,
      animationDuration: Duration(milliseconds: 150),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          settings.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.black38,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              _buildSliderRow(settings.multiplier),
              _buildSliderRow(settings.speed),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }

  SliderTheme _buildSlider(Field data) {
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
}
