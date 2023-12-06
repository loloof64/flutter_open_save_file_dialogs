import 'package:flutter/material.dart';

import 'package:open_save_file_dialogs/open_save_file_dialogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _openSaveFileDialogsPlugin = OpenSaveFileDialogs();
  String? savedFilePath;
  String? savedFolderPath;

  void _selectSavedFile() async {
    final path = await _openSaveFileDialogsPlugin.saveFileDialog(startingFileName: "test.txt");
    setState(() {
      savedFilePath = path;
    });
  }

  void _selectSavedFolder() async {
    final path = await _openSaveFileDialogsPlugin.saveFolderDialog();
    setState(() {
      savedFolderPath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OpenSaveFileDialogs example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Saved file path: $savedFilePath'),
              ElevatedButton(
                onPressed: _selectSavedFile,
                child: const Text(
                  'Select saved file',
                ),
              ),
              const SizedBox(height: 20),
              Text('Saved folder path: $savedFolderPath'),
              ElevatedButton(
                onPressed: _selectSavedFolder,
                child: const Text(
                  'Select saved folder',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
