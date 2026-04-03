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
    apiKey: 'AIzaSyDyqqCrEsMjIExtb3wgou8Qa8_3KZy0MiU',
    appId: '1:317776890768:web:35e047c2b86ab65a5b0115',
    messagingSenderId: '317776890768',
    projectId: 'fireapplication-d4bfe',
    authDomain: 'fireapplication-d4bfe.firebaseapp.com',
    databaseURL: 'https://fireapplication-d4bfe-default-rtdb.firebaseio.com',
    storageBucket: 'fireapplication-d4bfe.firebasestorage.app',
    measurementId: 'G-8F48BEW3H6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl8_bdG9OcEcrJr0EZuuCwk8MiWnDQET4',
    appId: '1:317776890768:android:33249ca8adbe8e5c5b0115',
    messagingSenderId: '317776890768',
    projectId: 'fireapplication-d4bfe',
    databaseURL: 'https://fireapplication-d4bfe-default-rtdb.firebaseio.com',
    storageBucket: 'fireapplication-d4bfe.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhEB5zy3k3vUay8m029Q1AVpVGu2RyPMo',
    appId: '1:317776890768:ios:1f06243ddd1aed625b0115',
    messagingSenderId: '317776890768',
    projectId: 'fireapplication-d4bfe',
    databaseURL: 'https://fireapplication-d4bfe-default-rtdb.firebaseio.com',
    storageBucket: 'fireapplication-d4bfe.firebasestorage.app',
    iosBundleId: 'com.example.chatApp1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhEB5zy3k3vUay8m029Q1AVpVGu2RyPMo',
    appId: '1:317776890768:ios:1f06243ddd1aed625b0115',
    messagingSenderId: '317776890768',
    projectId: 'fireapplication-d4bfe',
    databaseURL: 'https://fireapplication-d4bfe-default-rtdb.firebaseio.com',
    storageBucket: 'fireapplication-d4bfe.firebasestorage.app',
    iosBundleId: 'com.example.chatApp1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDyqqCrEsMjIExtb3wgou8Qa8_3KZy0MiU',
    appId: '1:317776890768:web:42d244d9f2126d565b0115',
    messagingSenderId: '317776890768',
    projectId: 'fireapplication-d4bfe',
    authDomain: 'fireapplication-d4bfe.firebaseapp.com',
    databaseURL: 'https://fireapplication-d4bfe-default-rtdb.firebaseio.com',
    storageBucket: 'fireapplication-d4bfe.firebasestorage.app',
    measurementId: 'G-S6L9QDQQ3R',
  );

}