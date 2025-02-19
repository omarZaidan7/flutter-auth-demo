import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/home_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  void signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String reEnterPassword = reEnterPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || reEnterPassword.isEmpty) {
      Fluttertoast.showToast(msg: "All fields must be filled");
      return;
    }

    if (password.length < 6) {
      Fluttertoast.showToast(msg: "Password must be at least 6 characters long");
      return;
    }

    if (password != reEnterPassword) {
      Fluttertoast.showToast(msg: "Passwords do not match");
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Fluttertoast.showToast(msg: "Sign-up successful!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Signup Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/bird_logo.avif', width: 200, height: 200),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: reEnterPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Re-enter Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
