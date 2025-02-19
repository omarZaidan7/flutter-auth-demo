import 'package:flutter/material.dart';
import 'package:firebase_auth_demo/home_screen.dart';

class Congrats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'success',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('congratulations you have successfully logged in', style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
    );

    
  }

  
}