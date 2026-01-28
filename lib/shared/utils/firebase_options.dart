import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      //return web;
    }
    // TODO find a way to get production or developmenrt
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return
        //AppConstants.appEnvironment == "prod"
        // ?
        android;
      //  : AppConstants.appEnvironment == "preprod"
      //  ? android_preprod
      //  : android_dev;

      case TargetPlatform.iOS:
        return
        //AppConstants.appEnvironment == "prod"
        //    ?
        ios;
      //   : AppConstants.appEnvironment == "preprod"
      //   ? ios_preprod
      //  : ios_dev;
      case TargetPlatform.macOS:
      // return macos;
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

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyDIFyFoxBP3RWl0O539V-gRwE93lQ_wYTw',
  //   appId: '1:138705464334:web:1e1576d9f7bd9af462e05f',
  //   messagingSenderId: '138705464334',
  //   projectId: 'coffeeweb-354711',
  //   authDomain: 'coffeeweb-354711.firebaseapp.com',
  //   databaseURL:
  //       'https://coffeeweb-354711-default-rtdb.asia-southeast1.firebasedatabase.app',
  //   storageBucket: 'coffeeweb-354711.appspot.com',
  //   measurementId: 'G-432F4XZMEW',
  // );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFFk0k1-EiGheNJ0mic8-3cXvQIgjQl1Q',
    appId: '1:971653692386:android:b3fe10858a0750b86597bb',
    messagingSenderId: '971653692386',
    projectId: 'splitapp-527a0',
    // databaseURL:
    //     'https://coffeeweb-354711-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'splitapp-527a0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLzNlGX2yYocWXGKANVVTnpaMPu3TsCro',
    appId: '1:971653692386:ios:18230d09a27d53e36597bb',
    messagingSenderId: '971653692386',
    projectId: 'splitapp-527a0',
    // databaseURL:
    //     'https://coffeeweb-354711-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'splitapp-527a0.firebasestorage.app',
    androidClientId:
        '233601607029-aoplm413tur116u6unhv01bofd6c6i9o.apps.googleusercontent.com',
    iosClientId:
        '233601607029-ll5qspcrva6rd176chjpvbad759s55fn.apps.googleusercontent.com',
    iosBundleId: 'com.hoft.app',
  );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyAorp4fwVCOcDixUKdEsuSwIv4V-7YbxzY',
  //   appId: '1:138705464334:ios:84f50f2bf6a4449e62e05f',
  //   messagingSenderId: '138705464334',
  //   projectId: 'coffeeweb-354711',
  //   databaseURL:
  //       'https://coffeeweb-354711-default-rtdb.asia-southeast1.firebasedatabase.app',
  //   storageBucket: 'coffeeweb-354711.appspot.com',
  //   androidClientId:
  //       '138705464334-85e8q35mpmh0rt397r6d7sa2b1suio69.apps.googleusercontent.com',
  //   iosClientId:
  //       '138705464334-he8rblq83c9hltmbmpdfiehg3bfasuqn.apps.googleusercontent.com',
  //   iosBundleId: 'com.coffeeweb.app',
  // );
}
