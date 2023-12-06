
import 'open_save_file_dialogs_platform_interface.dart';

class OpenSaveFileDialogs {
  Future<String?> getPlatformVersion() {
    return OpenSaveFileDialogPlatform.instance.getPlatformVersion();
  }
}
