import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_demo/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'AIzaSyBkWWOLpzPp-RvT_b3rSmSuTeikojDrNKg',
    appId: '1:1026151503588:android:66acc38f62b7c6e9f23ef1',
    projectId: 'login-demo-8a728',
    storageBucket: 'login-demo-8a728.firebasestorage.app', messagingSenderId: '',
  )
  ); 
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



