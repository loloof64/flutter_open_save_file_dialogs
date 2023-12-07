import 'package:open_save_file_dialogs/open_save_file_dialogs_usage.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class OpenSaveFileDialogPlatform extends PlatformInterface {
  /// Constructs a OpenSaveFileDialogPlatform.
  OpenSaveFileDialogPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenSaveFileDialogPlatform _instance = OpenSaveFileDialogUsage();

  /// The default instance of [OpenSaveFileDialogPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpenSaveFileDialog].
  static OpenSaveFileDialogPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpenSaveFileDialogPlatform] when
  /// they register themselves.
  static set instance(OpenSaveFileDialogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Open the Android save file dialog.
  /// content: The content of the file to save. (String)
  /// startingFileName: The name of the file to start with (null if no name should be set). (String?)
  /// Returns: The name of the saved file, or null if no file was selected. (String?)
  Future<String?> saveFileDialog({
    required String content,
    String? startingFileName,
  });

  /// Open the Android open file dialog.
  /// Returns: The content of the selected file, or null if no file was selected. (String?)
  Future<String?> openFileDialog();
}
