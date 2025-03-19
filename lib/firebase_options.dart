import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
          'DefaultFirebaseOptions have not been configured for $defaultTargetPlatform - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuHdy1KjIGkv-ZoimFGyuEfcBML-qBKd0',
    appId: '1:494033019984:android:c38d6f36061b5d1bf7dd55',
    messagingSenderId: '494033019984',
    projectId: 'kifuliiru-25396',
    storageBucket: 'kifuliiru-25396.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7LbqddwRKRaiKAb2PbLlrUwnfujn1xEk',
    appId: '1:494033019984:ios:ef0f277edaa54be2f7dd55',
    messagingSenderId: '494033019984',
    projectId: 'kifuliiru-25396',
    storageBucket: 'kifuliiru-25396.appspot.com',
    iosClientId: '494033019984-03trqi1klr4vn374d05hvfg4f4lp5ol0.apps.googleusercontent.com',
    iosBundleId: 'com.example.kifuliiruApp',
  );
} 