import 'package:open_save_file_dialogs/dart_api.dart';
import 'package:open_save_file_dialogs/open_save_file_dialogs_platform_interface.dart';

/// Class responsible for letting users opening and saving files for Android : implementation.
class OpenSaveFileDialogUsage extends OpenSaveFileDialogPlatform {
  final _api = OpenSaveFileDialogs();

  /// Open the Android save file dialog.
  /// content: The content of the file to save. (String)
  /// startingFileName: The name of the file to start with (null if no name should be set). (String?)
  /// Returns: The name of the saved file, or null if no file was selected. (String?)
  @override
  Future<String?> saveFileDialog(
      {required String content, String? startingFileName}) {
    return _api.saveFileDialog(
        content: content, startingFileName: startingFileName);
  }

  /// Open the Android open file dialog.
  /// Returns: The content of the selected file, or null if no file was selected. (String?)
  @override
  Future<String?> openFileDialog() {
    return _api.openFileDialog();
  }
}
