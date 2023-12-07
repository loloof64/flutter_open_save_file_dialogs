import 'open_save_file_dialogs_platform_interface.dart';

/// Class responsible for letting users opening and saving files for Android.
class OpenSaveFileDialogs {
  /// Open the Android save file dialog.
  /// content: The content of the file to save. (String)
  /// startingFileName: The name of the file to start with (null if no name should be set). (String?)
  /// Returns: The name of the saved file, or null if no file was selected. (String?)
  Future<String?> saveFileDialog(
      {required String content, String? startingFileName}) {
    return OpenSaveFileDialogPlatform.instance
        .saveFileDialog(content: content, startingFileName: startingFileName);
  }

  /// Open the Android open file dialog.
  /// Returns: The content of the selected file, or null if no file was selected. (String?)
  Future<String?> openFileDialog() {
    return OpenSaveFileDialogPlatform.instance.openFileDialog();
  }
}
