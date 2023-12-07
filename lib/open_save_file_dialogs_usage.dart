import 'package:open_save_file_dialogs/dart_api.dart';
import 'package:open_save_file_dialogs/open_save_file_dialogs_platform_interface.dart';

class OpenSaveFileDialogUsage extends OpenSaveFileDialogPlatform {
  final _api = OpenSaveFileDialogs();

  @override
  Future<String?> saveFileDialog(
      {required String content, String? startingFileName}) {
    return _api.saveFileDialog(
        content: content, startingFileName: startingFileName);
  }

  @override
  Future<String?> openFileDialog() {
    return _api.openFileDialog();
  }
}
