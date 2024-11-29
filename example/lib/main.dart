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

  String? savedFileName;
  String? openedFileContent;

  void _selectSavedFile() async {
    final newFileName = await _openSaveFileDialogsPlugin.saveFileDialog(
        content: "This is a\nsimple test.\n", startingFileName: "test.txt");
    setState(() {
      savedFileName = newFileName;
    });
  }

  void _selectOpenedFile() async {
    final content = await _openSaveFileDialogsPlugin.openFileDialog();
    setState(() {
      openedFileContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OpenSaveFileDialogs example app'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Saved file name: $savedFileName'),
                ElevatedButton(
                  onPressed: _selectSavedFile,
                  child: const Text(
                    'Select saved file',
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                      child:
                          Text('Opened file content:\n\n$openedFileContent')),
                ),
                ElevatedButton(
                  onPressed: _selectOpenedFile,
                  child: const Text(
                    'Select opened file',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
