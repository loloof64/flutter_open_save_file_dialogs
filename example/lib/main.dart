import 'package:flutter/material.dart';
import 'dart:async';

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
  String? path;

  void _selectFile() async {
    path = await _openSaveFileDialogsPlugin.saveFileDialog();
    print("Chemin sélectionné : $path");
    setState(() {
      path = path;
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
              Text('Selected path: $path'),
              ElevatedButton(
                onPressed: _selectFile,
                child: const Text(
                  'Select file',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
