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
    apiKey: 'AIzaSyAU0nAcKWFxJtQ0KNN5fj03IPnFWGi6Nm8',
    appId: '1:877796762227:web:e8eb9951bf0a37bc128006',
    messagingSenderId: '877796762227',
    projectId: 'finance-tracking-3a654',
    authDomain: 'finance-tracking-3a654.firebaseapp.com',
    storageBucket: 'finance-tracking-3a654.appspot.com',
    measurementId: 'G-JXWJCHX2NN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgrYAtggLE62okDTrCwUgB6fNuDsaeaYg',
    appId: '1:877796762227:android:c4b416b29d4025b8128006',
    messagingSenderId: '877796762227',
    projectId: 'finance-tracking-3a654',
    storageBucket: 'finance-tracking-3a654.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCapBuVvZ7o9JVMIHSNJp9BITBt8vBi1cM',
    appId: '1:877796762227:ios:21e60e6f1c950dd7128006',
    messagingSenderId: '877796762227',
    projectId: 'finance-tracking-3a654',
    storageBucket: 'finance-tracking-3a654.appspot.com',
    iosBundleId: 'com.example.financeTracking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCapBuVvZ7o9JVMIHSNJp9BITBt8vBi1cM',
    appId: '1:877796762227:ios:e2a3fa587a4cd0b5128006',
    messagingSenderId: '877796762227',
    projectId: 'finance-tracking-3a654',
    storageBucket: 'finance-tracking-3a654.appspot.com',
    iosBundleId: 'com.example.financeTracking.RunnerTests',
  );
}