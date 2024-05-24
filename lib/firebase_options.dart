// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBeEDp2urvAuUt7o4j7pufX6MVz6HIyPnE',
    appId: '1:281068618625:web:b2c208c442dca0bde71e80',
    messagingSenderId: '281068618625',
    projectId: 'flutterhw-b4b28',
    authDomain: 'flutterhw-b4b28.firebaseapp.com',
    storageBucket: 'flutterhw-b4b28.appspot.com',
    measurementId: 'G-F1P1L5TRCX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnh43zS2-6JuH7x8F8b8hQsXCNK5aPvl0',
    appId: '1:281068618625:android:974b50263015f116e71e80',
    messagingSenderId: '281068618625',
    projectId: 'flutterhw-b4b28',
    storageBucket: 'flutterhw-b4b28.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBeEDp2urvAuUt7o4j7pufX6MVz6HIyPnE',
    appId: '1:281068618625:web:2341219532da0e16e71e80',
    messagingSenderId: '281068618625',
    projectId: 'flutterhw-b4b28',
    authDomain: 'flutterhw-b4b28.firebaseapp.com',
    storageBucket: 'flutterhw-b4b28.appspot.com',
    measurementId: 'G-Q57QK5YGB3',
  );
}
