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
    apiKey: 'AIzaSyC2z8JjktQrDhq2pJ8bDTYBlcUgU5HbaOY',
    appId: '1:1068314366228:web:0e625f68530d8e85ebb201',
    messagingSenderId: '1068314366228',
    projectId: 'link-zone-799c6',
    authDomain: 'link-zone-799c6.firebaseapp.com',
    storageBucket: 'link-zone-799c6.appspot.com',
    measurementId: 'G-QDE7RSEPB9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDODwKApradfWe9g5UkiTym_5x7azWIjrw',
    appId: '1:1068314366228:android:b9b10fcdc67e9282ebb201',
    messagingSenderId: '1068314366228',
    projectId: 'link-zone-799c6',
    storageBucket: 'link-zone-799c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqCVahuwAsBeDByGr3R09mQ4kBgnFrPE0',
    appId: '1:1068314366228:ios:cebf22e5fc47c852ebb201',
    messagingSenderId: '1068314366228',
    projectId: 'link-zone-799c6',
    storageBucket: 'link-zone-799c6.appspot.com',
    iosBundleId: 'com.example.linkZone',
  );
}