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
          SettingsDutyCycleSubPanel(settings: data.dutyCycleSettings),
          SettingsRetriggerSubPanel(settings: data.retriggerSettings),
          SettingsFlangerSubPanel(settings: data.flangerSettings),
          SettingsLowPassFilterSubPanel(settings: data.lowPassFilterSettings),
          SettingsHighPassFilterSubPanel(settings: data.highPassFilterSettings),
        ],
      ),
    );
  }
}

// ##############---------------##############---------------
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
      animationDuration: Duration(milliseconds: 200),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          settings.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.attack),
              SettingsSlider(data: settings.sustain),
              SettingsSlider(data: settings.punch),
              SettingsSlider(data: settings.decay),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
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
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.frequency),
              SettingsSlider(data: settings.minCutoff),
              SettingsSlider(data: settings.slide),
              SettingsSlider(data: settings.deltaSlide),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
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
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.depth),
              SettingsSlider(data: settings.speed),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
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
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.multiplier),
              SettingsSlider(data: settings.speed),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }
}

// ##############---------------##############---------------
class SettingsDutyCycleSubPanel extends StatefulWidget {
  SettingsDutyCycleSubPanel({Key? key, required this.settings})
      : super(key: key);

  final DutyCycleSettings settings;

  @override
  _SettingsDutyCycleSubPanelsState createState() =>
      _SettingsDutyCycleSubPanelsState(settings);
}

class _SettingsDutyCycleSubPanelsState
    extends State<SettingsDutyCycleSubPanel> {
  final DutyCycleSettings settings;

  _SettingsDutyCycleSubPanelsState(this.settings);

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
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.dutyCycle),
              SettingsSlider(data: settings.sweep),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }
}

// ##############---------------##############---------------
class SettingsRetriggerSubPanel extends StatefulWidget {
  SettingsRetriggerSubPanel({Key? key, required this.settings})
      : super(key: key);

  final RetriggerSettings settings;

  @override
  _SettingsRetriggerSubPanelsState createState() =>
      _SettingsRetriggerSubPanelsState(settings);
}

class _SettingsRetriggerSubPanelsState
    extends State<SettingsRetriggerSubPanel> {
  final RetriggerSettings settings;

  _SettingsRetriggerSubPanelsState(this.settings);

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
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.rate),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }
}

// ##############---------------##############---------------
class SettingsFlangerSubPanel extends StatefulWidget {
  SettingsFlangerSubPanel({Key? key, required this.settings}) : super(key: key);

  final FlangerSettings settings;

  @override
  _SettingsFlangerSubPanelsState createState() =>
      _SettingsFlangerSubPanelsState(settings);
}

class _SettingsFlangerSubPanelsState extends State<SettingsFlangerSubPanel> {
  final FlangerSettings settings;

  _SettingsFlangerSubPanelsState(this.settings);

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
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.offset),
              SettingsSlider(data: settings.sweep),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }
}

// ##############---------------##############---------------
class SettingsLowPassFilterSubPanel extends StatefulWidget {
  SettingsLowPassFilterSubPanel({Key? key, required this.settings})
      : super(key: key);

  final LowPassFilterSettings settings;

  @override
  _SettingsLowPassFilterSubPanelsState createState() =>
      _SettingsLowPassFilterSubPanelsState(settings);
}

class _SettingsLowPassFilterSubPanelsState
    extends State<SettingsLowPassFilterSubPanel> {
  final LowPassFilterSettings settings;

  _SettingsLowPassFilterSubPanelsState(this.settings);

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
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.cutoffFreq),
              SettingsSlider(data: settings.cutoffSweep),
              SettingsSlider(data: settings.resonance),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }
}

// ##############---------------##############---------------
class SettingsHighPassFilterSubPanel extends StatefulWidget {
  SettingsHighPassFilterSubPanel({Key? key, required this.settings})
      : super(key: key);

  final HighPassFilterSettings settings;

  @override
  _SettingsHighPassFilterSubPanelsState createState() =>
      _SettingsHighPassFilterSubPanelsState(settings);
}

class _SettingsHighPassFilterSubPanelsState
    extends State<SettingsHighPassFilterSubPanel> {
  final HighPassFilterSettings settings;

  _SettingsHighPassFilterSubPanelsState(this.settings);

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
          backgroundColor: Theme.of(context).backgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildTitle(settings.title);
          },
          body: Column(
            children: [
              SettingsSlider(data: settings.cutoffFreq),
              SettingsSlider(data: settings.cutoffSweep),
            ],
          ),
          isExpanded: settings.isExpanded,
        ),
      ],
    );
  }
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class SettingsSlider extends StatefulWidget {
  SettingsSlider({Key? key, required this.data}) : super(key: key);

  final Field data;

  @override
  _SliderState createState() => _SliderState(data);
}

class _SliderState extends State<SettingsSlider> {
  final Field data;

  _SliderState(this.data);

  @override
  Widget build(BuildContext context) {
    return _buildSliderRow(data);
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
            flex: 3,
            child: _buildSlider(data),
          ),
        ],
      ),
    );
  }

  SliderTheme _buildSlider(Field data) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.orange,
        inactiveTrackColor: Colors.amberAccent,
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
