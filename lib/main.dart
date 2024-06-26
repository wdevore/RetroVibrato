import 'dart:async';

import 'package:flutter/material.dart';
import 'package:retro_vibrato/model/settings_model.dart';
import 'package:retro_vibrato/model/settings_provider.dart';
import 'package:retro_vibrato/model/choice_provider.dart';
import 'package:retro_vibrato/view/appbar_row.dart';
import 'package:retro_vibrato/view/auto_play.dart';
import 'package:retro_vibrato/view/file_open_access.dart';
import 'package:retro_vibrato/view/sample_rate.dart';
import 'package:retro_vibrato/view/settings_panels.dart';

void main() {
  runApp(FSfxrApp());
}

class FSfxrApp extends StatelessWidget {
  final SettingsModel settings = SettingsModel();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RetroVibrato', // App title
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
            .copyWith(background: Colors.grey[500]),
      ),
      home: FSfxrHomePage(
        title: 'RetroVibrato',
        settings: settings,
      ),
    );
  }
}

class FSfxrHomePage extends StatefulWidget {
  FSfxrHomePage({Key? key, required this.title, required this.settings})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final SettingsModel settings;

  @override
  _FSfxrHomePageState createState() => _FSfxrHomePageState(settings);
}

class _FSfxrHomePageState extends State<FSfxrHomePage> {
  final SettingsModel settings;
  final StreamController<String> notificationStream =
      StreamController<String>();

  _FSfxrHomePageState(
    this.settings,
  );

  @override
  void initState() {
    super.initState();
    notificationStream.stream.listen((event) {
      streamSetState(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
    notificationStream.close();
  }

  void streamSetState(String action) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(
          top: kToolbarHeight,
        ),
        child: FloatingActionButton(
          onPressed: () {
            print('Play');
          },
          child: const Icon(
            Icons.play_arrow,
            size: 50,
            color: Colors.blueGrey,
          ),
          backgroundColor: Colors.lime,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black54,
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
      child: Container(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: kToolbarHeight + 40,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Retro Vibrato',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.orange.shade100),
              child: ListTile(
                leading: Icon(Icons.save_outlined),
                title: const Text(
                  'Save as *.Sfxr',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  // Then close the drawer
                  // Navigator.pop(context);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.orange.shade200),
              child: ListTile(
                leading: Icon(Icons.save_outlined),
                title: const Text('Save as *.wav',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            FileOpenAccess(
              settings: settings,
              label: 'Load an *.Sfxr',
              notificationStream: notificationStream,
            ),
            SettingsSampleRateSubPanel(settings: settings.appSettings),
            SettingsAutoplayCheck(settings: settings.appSettings),
            Container(
              decoration: BoxDecoration(color: Colors.lime.shade400),
              child: ListTile(
                leading: Icon(Icons.help),
                title: const Text('About',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SettingsProvider _buildBody() {
    return SettingsProvider(
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(background: Colors.black26),
        ),
        child: SettingsExpansionPanels(settings),
      ),
    );
  }
}
