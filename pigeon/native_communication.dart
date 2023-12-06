import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/dart_api.dart',
  kotlinOut: 'android/src/main/kotlin/com/loloof64/open_save_file_dialogs/DartApi.kt',
  kotlinOptions: KotlinOptions(package: 'com.loloof64.open_save_file_dialogs'),
))

@HostApi()
abstract class OpenSaveFileDialogs {
  @async
  String? saveFileDialog(
    {String? startingFileName,}
  );
}