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
    apiKey: 'AIzaSyD8_Chj-MFEhYaxKR0c7lpDwgpbAt21OOA',
    appId: '1:455118491406:web:30451c0550af1e9c3e115f',
    messagingSenderId: '455118491406',
    projectId: 'tiktokclone-d1403',
    authDomain: 'tiktokclone-d1403.firebaseapp.com',
    storageBucket: 'tiktokclone-d1403.appspot.com',
    measurementId: 'G-EH01JB9BEX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBV_9u9AXVzmzhUZ4diNMJD-A9oWDZR20',
    appId: '1:455118491406:android:42ea6d562caff6c63e115f',
    messagingSenderId: '455118491406',
    projectId: 'tiktokclone-d1403',
    storageBucket: 'tiktokclone-d1403.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBByY24stjbQIeQfNGVjlYyWu5FKyqmwEQ',
    appId: '1:455118491406:ios:660acc1e7d518fce3e115f',
    messagingSenderId: '455118491406',
    projectId: 'tiktokclone-d1403',
    storageBucket: 'tiktokclone-d1403.appspot.com',
    iosClientId: '455118491406-joiv6mgm8d38bqh8abk0b88tvjk496p2.apps.googleusercontent.com',
    iosBundleId: 'com.tanvirmt.tiktokclone',
  );
}
