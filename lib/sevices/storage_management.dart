import 'dart:io';
import 'dart:math'; //min fonksiyonu için

import 'package:path_provider/path_provider.dart';

class StorageManagement {
  static makeDirectory({required String dirName}) async {
    final Directory? directory = await getExternalStorageDirectory();

    final _formattedDirName = '/$dirName/';
    final Directory _newDir =
        await Directory(directory!.path + _formattedDirName).create();

    return _newDir.path;
  }

  static get getAudioDir async => await makeDirectory(dirName: 'recordings');

  static createRecordAudioPath(
          {required String dirPath, required String fileName}) =>
      """$dirPath${fileName.substring(0, min(fileName.length, 100))}_${DateTime.now()}.aac""";
  //fileName.length ve 100 değerleri kullanılarak fileName.length'in 100'den küçük olup olmadığı kontrol ediyoruz
}
