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
    apiKey: 'AIzaSyDDQk0b-gHfknY2FyTL8c06YuO-KXYI2Ic',
    appId: '1:483816958379:web:b0e15dffec3f406cf28aee',
    messagingSenderId: '483816958379',
    projectId: 'tfgclara-a319f',
    authDomain: 'tfgclara-a319f.firebaseapp.com',
    storageBucket: 'tfgclara-a319f.appspot.com',
    measurementId: 'G-MH3RYYKBZB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAN71ZrUUDmvlov1HnkUNLaBAtk5PyGt7g',
    appId: '1:483816958379:android:af4d81eb30fc9c02f28aee',
    messagingSenderId: '483816958379',
    projectId: 'tfgclara-a319f',
    storageBucket: 'tfgclara-a319f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDENA_DcmJaufP7CMqj65PORfbpc6x382Q',
    appId: '1:483816958379:ios:78a6a12b208f7fcff28aee',
    messagingSenderId: '483816958379',
    projectId: 'tfgclara-a319f',
    storageBucket: 'tfgclara-a319f.appspot.com',
    androidClientId: '483816958379-7k05dub3gtte76j0f7kklmug6ar6jekf.apps.googleusercontent.com',
    iosClientId: '483816958379-e6jqrmlq3vt20c9ulmtg6gmd3tfo77m9.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDENA_DcmJaufP7CMqj65PORfbpc6x382Q',
    appId: '1:483816958379:ios:78a6a12b208f7fcff28aee',
    messagingSenderId: '483816958379',
    projectId: 'tfgclara-a319f',
    storageBucket: 'tfgclara-a319f.appspot.com',
    androidClientId: '483816958379-7k05dub3gtte76j0f7kklmug6ar6jekf.apps.googleusercontent.com',
    iosClientId: '483816958379-e6jqrmlq3vt20c9ulmtg6gmd3tfo77m9.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );
}