// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCkYx2L-NZHTnGjQbSfsx7WlynEuWqqERo',
    appId: '1:552152937918:web:620c30355fbbfaaa3af5ef',
    messagingSenderId: '552152937918',
    projectId: 'data-voice-record',
    authDomain: 'data-voice-record.firebaseapp.com',
    storageBucket: 'data-voice-record.appspot.com',
    measurementId: 'G-2CDES52K0R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwbCH_HXGecFARPr_8PLfZdBK6TaqqAqI',
    appId: '1:552152937918:android:dbb3b441aef23e143af5ef',
    messagingSenderId: '552152937918',
    projectId: 'data-voice-record',
    storageBucket: 'data-voice-record.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOWCWmJONv3wUst88Tl9n-nRohkKW968M',
    appId: '1:552152937918:ios:9ac58220790a0e553af5ef',
    messagingSenderId: '552152937918',
    projectId: 'data-voice-record',
    storageBucket: 'data-voice-record.appspot.com',
    androidClientId: '552152937918-b1r4f85uld06h5hncikdpfo0d7d8m7dq.apps.googleusercontent.com',
    iosClientId: '552152937918-jbi614dpv19iurbbsh69isq3s4ik5r65.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterVoiceRecord',
  );
}