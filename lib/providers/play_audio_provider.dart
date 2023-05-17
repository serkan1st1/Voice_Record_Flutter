import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayAudioProvider extends ChangeNotifier {
  final _justAudio = AudioPlayer();
  double _currAudioPlaying = 0.0; //Ses sıfır noktasında başlangıç
  bool _isSongPlaying = false;
  String _audioFilePath = '';

  bool get isSongPlaying => _isSongPlaying;
  String get currSongPath => _audioFilePath;

  setAudioFilePath(String incomingAudioFilePath) {
    _audioFilePath = incomingAudioFilePath;
    notifyListeners();
  }

  clearAudioFilePath() {
    _audioFilePath = '';
    notifyListeners();
  }

  playAudio(File incomingAudioFile, {bool update = true}) {
    try {
      _justAudio.positionStream.listen((event) {
        _currAudioPlaying = event.inMicroseconds.ceilToDouble();
        if (update) notifyListeners();
      });

      _justAudio.playerStateStream.listen((event) async {
        if (event.processingState == ProcessingState.completed) {
          await _justAudio.stop();
          _reset();
        }
        if (_audioFilePath != incomingAudioFile.path) {
          setAudioFilePath(incomingAudioFile.path);

          await _justAudio.setFilePath(incomingAudioFile.path);
          updateSongPlayingStatus(true);
          await _justAudio.play();
        }
        if (event.processingState == ProcessingState.idle) {
          //Ses kaynağı henüz yüklenmediyse
          await _justAudio.setFilePath(incomingAudioFile.path);
          updateSongPlayingStatus(true);
          await _justAudio.play();
        } else if (_justAudio.playing) {
          updateSongPlayingStatus(
              false); //Ses çalarken play butonuna basıldığında
          await _justAudio.pause();
        } else if (event.processingState == ProcessingState.ready) {
          updateSongPlayingStatus(true);
          await _justAudio.play();
        }
      });
    } catch (e) {
      print('Error in playaudio: $e');
    }
  }

  _reset() {
    _currAudioPlaying = 0.0; //Sesi sıfırlıyoruz
    notifyListeners();

    updateSongPlayingStatus(false);
  }

  updateSongPlayingStatus(bool status) {
    //Sesin çalma durumuna gore
    _isSongPlaying = status;
    notifyListeners();
  }

  get currLoadingStatus {
    final _currTime = (_currAudioPlaying /
        (_justAudio.duration?.inMicroseconds.ceilToDouble() ?? 1.0));

    return _currTime > 1.0 ? 1.0 : _currTime;
  }
}
