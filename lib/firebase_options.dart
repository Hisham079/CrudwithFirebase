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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyAZTdcJG_n3dB1YFWSqbZslKG4_qqc1feE',
    appId: '1:887405986006:web:ee64d52293a9c25bd74977',
    messagingSenderId: '887405986006',
    projectId: 'taskease-15a17',
    authDomain: 'taskease-15a17.firebaseapp.com',
    storageBucket: 'taskease-15a17.appspot.com',
    measurementId: 'G-XD4N0WH2JZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCY3NOr14QhGWEG1QF1yny9ppReQL92i0c',
    appId: '1:887405986006:android:98184aafc906613ad74977',
    messagingSenderId: '887405986006',
    projectId: 'taskease-15a17',
    storageBucket: 'taskease-15a17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWGTRkYw5s1RYkNSVnPsYyIcb2R1NRtJ4',
    appId: '1:887405986006:ios:841e3567f2a92031d74977',
    messagingSenderId: '887405986006',
    projectId: 'taskease-15a17',
    storageBucket: 'taskease-15a17.appspot.com',
    iosBundleId: 'sample.testEase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWGTRkYw5s1RYkNSVnPsYyIcb2R1NRtJ4',
    appId: '1:887405986006:ios:841e3567f2a92031d74977',
    messagingSenderId: '887405986006',
    projectId: 'taskease-15a17',
    storageBucket: 'taskease-15a17.appspot.com',
    iosBundleId: 'sample.testEase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZTdcJG_n3dB1YFWSqbZslKG4_qqc1feE',
    appId: '1:887405986006:web:631c4b29f54f969cd74977',
    messagingSenderId: '887405986006',
    projectId: 'taskease-15a17',
    authDomain: 'taskease-15a17.firebaseapp.com',
    storageBucket: 'taskease-15a17.appspot.com',
    measurementId: 'G-9CBW083T1L',
  );
}
