import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone_1/pages/home_page.dart';
import 'package:instagramclone_1/pages/reset_password.dart';
import 'package:instagramclone_1/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          forgetPassword(context),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailtextcontroller.text,
                        password: _passwordtextcontroller.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                });
              },
              child: Text("Login")),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => SignUpPage())));
              },
              child: Text("SignUp"))
        ],
      ),
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResetPassword()));
          },
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.right,
          )),
    );
  }
}
