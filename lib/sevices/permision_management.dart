import 'package:permission_handler/permission_handler.dart';

class PermisionManagement {
  static Future<bool> storagePermission() async {
    final status = await Permission.storage.request(); //Telefon depolama izni
    return status == PermissionStatus.granted;
  }

  static Future<bool> recordingPermission() async {
    final status = await Permission.microphone.request(); //Mikrofon izni
    return status == PermissionStatus.granted;
  }
}
