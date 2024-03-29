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
    apiKey: 'AIzaSyCxpddqvtkGn8kyBKZiqkaxf8EkkjN0Uzo',
    appId: '1:754008135574:web:d14b87c50b264b6461afb7',
    messagingSenderId: '754008135574',
    projectId: 'mobile-airticle-swipe',
    authDomain: 'mobile-airticle-swipe.firebaseapp.com',
    storageBucket: 'mobile-airticle-swipe.appspot.com',
    measurementId: 'G-G2GC0SB8GK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAakqm2nn73une3w0ul-FA6IfBKjHrww-U',
    appId: '1:754008135574:android:4b9fc8332740dcc061afb7',
    messagingSenderId: '754008135574',
    projectId: 'mobile-airticle-swipe',
    storageBucket: 'mobile-airticle-swipe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFiDFvChsv1mhg_nmg_902WF0x_8tJszE',
    appId: '1:754008135574:ios:10ab6445effa501a61afb7',
    messagingSenderId: '754008135574',
    projectId: 'mobile-airticle-swipe',
    storageBucket: 'mobile-airticle-swipe.appspot.com',
    iosClientId: '754008135574-a6fps8oe3r0t1cghqb38rk4jj9skfdh0.apps.googleusercontent.com',
    iosBundleId: 'com.example.frontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFiDFvChsv1mhg_nmg_902WF0x_8tJszE',
    appId: '1:754008135574:ios:10ab6445effa501a61afb7',
    messagingSenderId: '754008135574',
    projectId: 'mobile-airticle-swipe',
    storageBucket: 'mobile-airticle-swipe.appspot.com',
    iosClientId: '754008135574-a6fps8oe3r0t1cghqb38rk4jj9skfdh0.apps.googleusercontent.com',
    iosBundleId: 'com.example.frontend',
  );
}
