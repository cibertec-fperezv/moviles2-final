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
        return macos;
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
    apiKey: 'AIzaSyAMmwu0tA9XAtc9uXQAY2Efl0Bsotvldfw',
    appId: '1:202047020695:web:2440f04ad1cb0f730353d2',
    messagingSenderId: '202047020695',
    projectId: 'cibertec-653ee',
    authDomain: 'cibertec-653ee.firebaseapp.com',
    storageBucket: 'cibertec-653ee.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDagz-kPZkHJ8tfMLg1nv0YEZMnaROOHH4',
    appId: '1:202047020695:android:42bc4228fd6125140353d2',
    messagingSenderId: '202047020695',
    projectId: 'cibertec-653ee',
    storageBucket: 'cibertec-653ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwNgdzm9wXGRECJ_vorOtxQxvaD2zNCZY',
    appId: '1:202047020695:ios:28b05876a00475880353d2',
    messagingSenderId: '202047020695',
    projectId: 'cibertec-653ee',
    storageBucket: 'cibertec-653ee.appspot.com',
    iosBundleId: 'com.example.damIiFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwNgdzm9wXGRECJ_vorOtxQxvaD2zNCZY',
    appId: '1:202047020695:ios:107dc7ee88f2273a0353d2',
    messagingSenderId: '202047020695',
    projectId: 'cibertec-653ee',
    storageBucket: 'cibertec-653ee.appspot.com',
    iosBundleId: 'com.example.damIiFinal.RunnerTests',
  );
}
