import 'package:flutter/material.dart';
import 'package:instagramclone_1/pages/home_page.dart';
import 'package:instagramclone_1/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordtextcontroller = TextEditingController();
  TextEditingController _emailtextcontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailtextcontroller.dispose();
    _passwordtextcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailtextcontroller,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextFormField(
            controller: _passwordtextcontroller,
            decoration: InputDecoration(hintText: "Password"),
          ),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailtextcontroller.text,
                        password: _passwordtextcontroller.text)
                    .then((value) {
                  print("Created new account");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                });
              },
              child: Text("SignUp")),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => LoginPage())));
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
