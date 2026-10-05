// File generated for web support.
// Source: firebase.json (web app config) + android/app/google-services.json
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDHq_ELqiHb86e-EjUYjBT3kcCI0iIQJ4A',
    appId: '1:137665783508:web:c5fee320095a3ac2b2bd41',
    messagingSenderId: '137665783508',
    projectId: 'ecommerceapp-887b5',
    authDomain: 'ecommerceapp-887b5.firebaseapp.com',
    storageBucket: 'ecommerceapp-887b5.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHq_ELqiHb86e-EjUYjBT3kcCI0iIQJ4A',
    appId: '1:137665783508:android:e110f5379ee38ac8b2bd41',
    messagingSenderId: '137665783508',
    projectId: 'ecommerceapp-887b5',
    storageBucket: 'ecommerceapp-887b5.firebasestorage.app',
  );
}
