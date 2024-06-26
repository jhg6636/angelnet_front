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
    apiKey: 'AIzaSyDJfuOJwJMo1vWA_UmapTFTKOlSNRh0OR8',
    appId: '1:807437189527:web:73f6b2c161df35396044d2',
    messagingSenderId: '807437189527',
    projectId: 'angelnet-bcded',
    authDomain: 'angelnet-bcded.firebaseapp.com',
    storageBucket: 'angelnet-bcded.appspot.com',
    measurementId: 'G-W7912T9FM5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbAAU7V9J1ZtzAfoWQ4VIuNO3wiWBu694',
    appId: '1:807437189527:android:95288db9213ed8bb6044d2',
    messagingSenderId: '807437189527',
    projectId: 'angelnet-bcded',
    storageBucket: 'angelnet-bcded.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP0rM7KtjkHa9-72qo0zfCVqbcHarVqfs',
    appId: '1:807437189527:ios:54d32c4c07e2e12d6044d2',
    messagingSenderId: '807437189527',
    projectId: 'angelnet-bcded',
    storageBucket: 'angelnet-bcded.appspot.com',
    iosClientId: '807437189527-9gtbri3aav0q7o6f9jfum3bmbo23gvfv.apps.googleusercontent.com',
    iosBundleId: 'com.reventures.backofficeFront',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBP0rM7KtjkHa9-72qo0zfCVqbcHarVqfs',
    appId: '1:807437189527:ios:54d32c4c07e2e12d6044d2',
    messagingSenderId: '807437189527',
    projectId: 'angelnet-bcded',
    storageBucket: 'angelnet-bcded.appspot.com',
    iosClientId: '807437189527-9gtbri3aav0q7o6f9jfum3bmbo23gvfv.apps.googleusercontent.com',
    iosBundleId: 'com.reventures.backofficeFront',
  );
}
