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
    apiKey: 'AIzaSyDToBefhW94y33yTDxvNJoV3oMHNYBDXGI',
    appId: '1:184948073218:web:d15b40c3edf9725bd3d81b',
    messagingSenderId: '184948073218',
    projectId: 'phc-lab-c39e3',
    authDomain: 'phc-lab-c39e3.firebaseapp.com',
    storageBucket: 'phc-lab-c39e3.appspot.com',
    measurementId: 'G-W60V7WHJTQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0L-h-L1S2gAzEMcQFj3VCvWgdLs8H56o',
    appId: '1:184948073218:android:9f3eaad887d26bd9d3d81b',
    messagingSenderId: '184948073218',
    projectId: 'phc-lab-c39e3',
    storageBucket: 'phc-lab-c39e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkkJMl9hyH-OXdLIOfMCjD3_PX32cs5Jg',
    appId: '1:184948073218:ios:937a17080558ebefd3d81b',
    messagingSenderId: '184948073218',
    projectId: 'phc-lab-c39e3',
    storageBucket: 'phc-lab-c39e3.appspot.com',
    iosBundleId: 'com.phclab.app',
  );
}