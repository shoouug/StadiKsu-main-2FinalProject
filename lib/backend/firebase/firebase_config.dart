import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB9DK2cf1ZpOTxm1xzqJpQIwLHmTdcMWEY",
            authDomain: "stadiksu-2024.firebaseapp.com",
            projectId: "stadiksu-2024",
            storageBucket: "stadiksu-2024.appspot.com",
            messagingSenderId: "979373514059",
            appId: "1:979373514059:web:7fbe3e15b818e069a19cce",
            measurementId: "G-758R02MQQJ"));
  } else {
    await Firebase.initializeApp();
  }
}
