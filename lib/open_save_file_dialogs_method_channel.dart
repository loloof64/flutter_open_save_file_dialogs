import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'open_save_file_dialogs_platform_interface.dart';

/// An implementation of [OpenSaveFileDialogPlatform] that uses method channels.
class MethodChannelOpenSaveFileDialog extends OpenSaveFileDialogPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('open_save_file_dialog');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
