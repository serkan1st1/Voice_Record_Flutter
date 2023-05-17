import 'package:flutter/material.dart';
import 'package:flutter_voice_record/sevices/permision_management.dart';
import 'package:flutter_voice_record/sevices/storage_management.dart';
import 'package:flutter_voice_record/sevices/toast_services.dart';
import 'package:record/record.dart';

class RecordAudioProvider extends ChangeNotifier {
  final Record _record = Record();
  bool _isRecording = false;
  String _afterRecordingFilePath = '';

  bool get isRecording => _isRecording;
  String get recordedFilePath => _afterRecordingFilePath;

  clearOldData() {
    _afterRecordingFilePath = '';
    notifyListeners();
  }

  recordVoice() async {
    final _isPermitted = (await PermisionManagement.recordingPermission()) &&
        (await PermisionManagement.storagePermission());

    if (!_isPermitted) return;

    if (!(await _record.hasPermission())) return;

    final _voiceDirPath = await StorageManagement.getAudioDir;
    final _voiceFilePath = await StorageManagement.createRecordAudioPath(
        dirPath: _voiceDirPath, fileName: 'audio_message');

    await _record.start(path: _voiceFilePath);
    _isRecording = true;
    notifyListeners();

    showToast('RecordinG Started');
  }

  stopRecording() async {
    String? _audioFilePath;
    if (await _record.isRecording()) {
      _audioFilePath = await _record
          .stop(); //Kayıt durduğu zaman dosyayı kayıt etmemiz gerekir.
      showToast('Recording Stopped');
    }

    _isRecording = false;
    _afterRecordingFilePath = _audioFilePath ?? '';
    notifyListeners();
  }
}
