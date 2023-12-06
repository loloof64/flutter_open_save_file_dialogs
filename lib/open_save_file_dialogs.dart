
import 'open_save_file_dialogs_platform_interface.dart';

class OpenSaveFileDialogs {
  /// Open the Android save file dialog.
  /// startingFileName: The name of the file to start with (null if no name should be set). (String?)
  /// Returns: The path to the saved file, or null if no file was selected. (String?)
  Future<String?> saveFileDialog({String? startingFileName}) {
    return OpenSaveFileDialogPlatform.instance.saveFileDialog(startingFileName: startingFileName);
  }

  /// Open the Android open file dialog.
  /// Returns: The path to the selected file, or null if no file was selected. (String?)
  Future<String?> openFileDialog() {
    return OpenSaveFileDialogPlatform.instance.openFileDialog();
  }

  /// Open the Android select folder dialog.
  Future<String?> folderDialog() {
    return OpenSaveFileDialogPlatform.instance.folderDialog();
  }
}
