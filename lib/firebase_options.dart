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
    apiKey: 'AIzaSyC7Pao0OJjOk9eRfMykOL4qHHREpowbNCg',
    appId: '1:49192536707:web:2b2cbfe518b6cd45df69b6',
    messagingSenderId: '49192536707',
    projectId: 'pet-planet-dd94b',
    authDomain: 'pet-planet-dd94b.firebaseapp.com',
    storageBucket: 'pet-planet-dd94b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0pBitW_c1bIcuqkjjOyqPeW8dHg7AnRo',
    appId: '1:49192536707:android:f8bd3b32322e44e9df69b6',
    messagingSenderId: '49192536707',
    projectId: 'pet-planet-dd94b',
    storageBucket: 'pet-planet-dd94b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAjzG7TKiS9OpsKPELISm8BPNl8c1nwM4',
    appId: '1:49192536707:ios:f9111cd576472944df69b6',
    messagingSenderId: '49192536707',
    projectId: 'pet-planet-dd94b',
    storageBucket: 'pet-planet-dd94b.appspot.com',
    iosClientId: '49192536707-l7c59gu0t0978rrh8t2ldq6adonhlml1.apps.googleusercontent.com',
    iosBundleId: 'com.example.petPlanet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAjzG7TKiS9OpsKPELISm8BPNl8c1nwM4',
    appId: '1:49192536707:ios:a82486b4b9e18e95df69b6',
    messagingSenderId: '49192536707',
    projectId: 'pet-planet-dd94b',
    storageBucket: 'pet-planet-dd94b.appspot.com',
    iosClientId: '49192536707-ek79ulb06in9n6f47sha70fp04v0lc88.apps.googleusercontent.com',
    iosBundleId: 'com.example.petPlanet.RunnerTests',
  );
}
