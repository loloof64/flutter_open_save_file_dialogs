import 'package:open_save_file_dialogs/dart_api.dart';
import 'package:open_save_file_dialogs/open_save_file_dialogs_platform_interface.dart';

class OpenSaveFileDialogUsage extends OpenSaveFileDialogPlatform {
  final _api = OpenSaveFileDialogs();

  @override
  Future<String?> saveFileDialog({String? startingFileName}) {
    return _api.saveFileDialog(startingFileName: startingFileName);
  }

  @override
  Future<String?> openFileDialog() {
    return _api.openFileDialog();
  }

  @override
  Future<String?> folderDialog() {
    return _api.folderDialog();
  }
}