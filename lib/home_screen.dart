import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/signup_screen.dart';
import 'package:firebase_auth_demo/congrats.dart'; 

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Congrats()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset('assets/bird_logo.avif', width: 200, height: 200),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'Login or Register to continue',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Login'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignupScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                        child: Text('Register'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
