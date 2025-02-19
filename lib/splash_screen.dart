import 'package:flutter/material.dart';
import 'package:firebase_auth_demo/main.dart'; 
import 'package:lottie/lottie.dart'; 
import 'package:firebase_auth_demo/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/rocket.json', 
          width: 200,  
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}