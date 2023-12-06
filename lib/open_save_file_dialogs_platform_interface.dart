import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'open_save_file_dialogs_method_channel.dart';

abstract class OpenSaveFileDialogPlatform extends PlatformInterface {
  /// Constructs a OpenSaveFileDialogPlatform.
  OpenSaveFileDialogPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenSaveFileDialogPlatform _instance = MethodChannelOpenSaveFileDialog();

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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
