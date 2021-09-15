import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/settings_model.dart';
import 'package:retro_vibrato/model/settings_provider.dart';
import 'package:retro_vibrato/model/slider_model.dart';
import 'package:retro_vibrato/view/custom_slider_thumb_rect.dart';

/// This is the stateful widget that the main application instantiates.
class SliderExpansionPanel extends StatefulWidget {
  const SliderExpansionPanel({
    Key? key,
    // required this.data,
    // required this.sliderCallback,
  }) : super(key: key);

  // final double _currentSliderValue = 0.5;
  // final SliderCallback sliderCallback;

  // final List<Item> data;

  @override
  State<SliderExpansionPanel> createState() => _SliderExpansionPanelState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliderExpansionPanelState extends State<SliderExpansionPanel> {
  double _currentSliderValue = 0.5;
  _SliderExpansionPanelState();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    final provider = SettingsProvider.of(context);
    SettingsModel data = provider.settingsModel;

    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: Colors.white,
      animationDuration: Duration(milliseconds: 150),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          // _data[index].isExpanded = !isExpanded;
        });
      },
      children: [],
      // _data.map<ExpansionPanel>((Item item) {
      //   return ExpansionPanel(
      //     backgroundColor: Colors.black38,
      //     headerBuilder: (BuildContext context, bool isExpanded) {
      //       return ListTile(
      //         isThreeLine: false,
      //         title: Container(
      //           alignment: Alignment.center,
      //           color: Colors.black26,
      //           child: Text(
      //             item.headerValue,
      //             style: TextStyle(
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //     body: Column(
      //       children: [
      //         _buildSliderRow(item, 'Attack'),
      //       ],
      //     ),
      //     isExpanded: item.isExpanded,
      //   );
      // }).toList(),
    );
  }

  Container _buildSliderRow(Item item, String label) {
    return Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: _buildCustomSlider(item.expandedValue),
            ),
          ],
        ));
  }

  SliderTheme _buildCustomSlider(double sliderValue) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.blue[700],
        inactiveTrackColor: Colors.blue[700],
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 10.0,
        thumbColor: Colors.white,
        thumbShape: CustomSliderThumbRect(
          thumbRadius: 15.0,
          thumbHeight: 25,
          min: 0,
          max: 100,
          sliderValue: sliderValue,
        ),
        overlayColor: Colors.blue.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Slider(
        value: _currentSliderValue,
        min: 0.0,
        max: 1.0,
        divisions: 100,
        onChanged: (value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
