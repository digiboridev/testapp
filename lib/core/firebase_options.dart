// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLoW9D5AbGj4Ptk9GLwwCe3JIhYWwc_Ho',
    appId: '1:1019512963583:android:423e5501bacfae55f2a7ca',
    messagingSenderId: '1019512963583',
    projectId: 'testapp-4e88a',
    storageBucket: 'testapp-4e88a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqULCo17JwfVF1t5zhzYCI5ldHlIEw0eg',
    appId: '1:1019512963583:ios:4dca3d9a080216f9f2a7ca',
    messagingSenderId: '1019512963583',
    projectId: 'testapp-4e88a',
    storageBucket: 'testapp-4e88a.appspot.com',
    iosClientId: '1019512963583-n1jj63lg8loo4i6kmu8epenfqem07pnr.apps.googleusercontent.com',
    iosBundleId: 'com.digiboridev.testapp',
  );
}
