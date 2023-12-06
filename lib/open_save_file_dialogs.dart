
import 'open_save_file_dialogs_platform_interface.dart';

class OpenSaveFileDialogs {
  Future<String?> saveFileDialog({String? startingFileName}) {
    return OpenSaveFileDialogPlatform.instance.saveFileDialog(startingFileName: startingFileName);
  }

  Future<String?> saveFolderDialog() {
    return OpenSaveFileDialogPlatform.instance.saveFolderDialog();
  }
}
