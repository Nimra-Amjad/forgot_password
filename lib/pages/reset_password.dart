import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone_1/pages/home_page.dart';
import 'package:instagramclone_1/pages/login_page.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailtextcontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailtextcontroller.dispose();
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
          TextButton(
              onPressed: () {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _emailtextcontroller.text)
                    .then((value) => Navigator.of(context).pop());
              },
              child: Text("Reset Password")),
        ],
      ),
    );
  }
}
