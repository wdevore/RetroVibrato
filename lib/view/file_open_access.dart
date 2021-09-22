import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retro_vibrato/model/settings_model.dart';

// https://github.com/miguelpruivo/flutter_file_picker/blob/master/example/lib/src/file_picker_demo.dart
// Old attempt is here
// https://snowdeer.github.io/flutter/2020/06/07/flutter-use-file-dialog/

class FileOpenAccess extends StatefulWidget {
  FileOpenAccess({
    Key? key,
    required this.settings,
    required this.label,
  }) : super(key: key);

  final SettingsModel settings;
  final String label;

  @override
  _FileOpenAccessState createState() => _FileOpenAccessState(
        settings,
        label,
      );
}

class _FileOpenAccessState extends State<FileOpenAccess> {
  final SettingsModel settings;
  final String label;

  _FileOpenAccessState(this.settings, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.orange.shade300),
      child: ListTile(
        leading: Icon(Icons.save_outlined),
        title: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        onTap: () {
          showOpenDialog();
          Navigator.pop(context);
        },
      ),
    );
  }

  void showOpenDialog() async {
    String? initDirectory;
    // if (Platform.isMacOS || Platform.isWindows) {
    initDirectory = (await getApplicationDocumentsDirectory()).path;
    // }
    print(initDirectory);
    FilePickerResult? fpr = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );

    print('---------------------------------------------');
    print(fpr?.files.first.path);

    if (fpr != null) {
      var file = File(fpr.files.first.path!);
      String json = (await (file.readAsString(encoding: ascii)));
      settings.fromJson(json);
    }
  }
}
