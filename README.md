# open save file dialog

A Flutter plugin for opening and saving files on Android.

### Dialogs

#### Select a file for saving

Call the async method `saveFileDialog`, where you pass a String for the new file content, and you can pass a String for the named parameter `startingFileName` if you want.

You get the saved file name as a String(you could get another name if the selected name is already taken by another file and you don't select it for rewriting), or null if no file was selected.

```dart
import 'package:open_save_file_dialogs/open_save_file_dialogs.dart';
...
final _openSaveFileDialogsPlugin = OpenSaveFileDialogs();
...
final newFileName = await _openSaveFileDialogsPlugin.saveFileDialog(content: myTextContent, startingFileName: "test.txt");
```

#### Select a file for opening

Call the async method `openFileDialog`.
You get the selected file content as a String, or null if no file was selected.

Throws an exception if the content could not be read.

```dart
import 'package:open_save_file_dialogs/open_save_file_dialogs.dart';
...
final _openSaveFileDialogsPlugin = OpenSaveFileDialogs();
...
final path = await _openSaveFileDialogsPlugin.openFileDialog();
```

## For developers

### Updating native code

If needed, run

```dart run pigeon --input pigeon/native_communication.dart```

in order to update generated native code
