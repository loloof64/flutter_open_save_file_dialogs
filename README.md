# open save file dialog

A Flutter plugin for opening and saving files on Android.

### Dialogs

#### Select a file for saving

Call the async method `saveFileDialog`, where you can pass a String for the named parameter `startingFileName` if you want.
You get the selected path as a String, or null if no file was selected.

```dart
import 'package:open_save_file_dialogs/open_save_file_dialogs.dart';
...
final _openSaveFileDialogsPlugin = OpenSaveFileDialogs();
...
final path = await _openSaveFileDialogsPlugin.saveFileDialog(startingFileName: "test.txt");
```

#### Select a file for opening

Call the async method `openFileDialog`, where you can pass a String for the named parameter `startingFileName` if you want.
You get the selected path as a String, or null if no file was selected.

```dart
import 'package:open_save_file_dialogs/open_save_file_dialogs.dart';
...
final _openSaveFileDialogsPlugin = OpenSaveFileDialogs();
...
final path = await _openSaveFileDialogsPlugin.openFileDialog(startingFileName: "test.txt");
```

### Select a folder

Call the async method `folderDialog`.
You get the selected path as a String, or null if no folder was selected.

```dart
import 'package:open_save_file_dialogs/open_save_file_dialogs.dart';
...
final _openSaveFileDialogsPlugin = OpenSaveFileDialogs();
...
final path = await _openSaveFileDialogsPlugin.folderDialog();
```

## For developers

### updating native code

If needed, run

```dart run pigeon --input pigeon/native_communication.dart```

in order to update generated native code
