import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/settings_model.dart';
import 'package:retro_vibrato/model/settings_provider.dart';
import 'package:retro_vibrato/model/choice_provider.dart';
import 'package:retro_vibrato/view/appbar_row.dart';
import 'package:retro_vibrato/view/custom_slider_thumb_rect.dart';
import 'package:retro_vibrato/view/settings_panels.dart';

void main() {
  runApp(FSfxrApp());
}

class FSfxrApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RetroVibrato', // App title
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.orange,
      ),
      home: FSfxrHomePage(title: 'RetroVibrato'),
    );
  }
}

class FSfxrHomePage extends StatefulWidget {
  FSfxrHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _FSfxrHomePageState createState() => _FSfxrHomePageState();
}

class _FSfxrHomePageState extends State<FSfxrHomePage> {
  double _currentSliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildExpansionPanelBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black45,
      // Here we take the value from the FSfxrHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: ChoiceProvider(child: AppBarRow()),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  SettingsProvider _buildExpansionPanelBody() {
    return SettingsProvider(child: SettingsPanels());
  }

  // SliderTheme _buildCustomSlider(EnvelopeSettings env) {
  //   print('build slider : ${env.attack}');
  //   return SliderTheme(
  //     data: SliderTheme.of(context).copyWith(
  //       activeTrackColor: Colors.blue[700],
  //       inactiveTrackColor: Colors.blue[700],
  //       trackShape: RectangularSliderTrackShape(),
  //       trackHeight: 10.0,
  //       thumbColor: Colors.white,
  //       thumbShape: CustomSliderThumbRect(
  //         thumbRadius: 15.0,
  //         thumbHeight: 25,
  //         min: 0,
  //         max: 100,
  //         sliderValue: env.attack,
  //       ),
  //       overlayColor: Colors.blue.withAlpha(32),
  //       overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
  //     ),
  //     child: Slider(
  //       value: env.attack,
  //       min: 0.0,
  //       max: 1.0,
  //       divisions: 100,
  //       onChanged: (value) {
  //         setState(() {
  //           print('val: $env.attack');
  //           env.attack = value;
  //         });
  //       },
  //     ),
  //   );
  // }

  SliderTheme _buildBasicSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.red[700],
        inactiveTrackColor: Colors.red[100],
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: Colors.redAccent,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Colors.red.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Slider(
        value: _currentSliderValue,
        min: 0,
        max: 100,
        divisions: 5,
        onChanged: (value) {
          print('basic value: $value');
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
