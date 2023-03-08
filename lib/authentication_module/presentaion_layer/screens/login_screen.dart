import 'package:flutter/material.dart';
import 'package:graduation_project/core/services/auth_services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: const Text('login with google'),
        onPressed: () {
          AuthServices().signInWithFacebook();
        },
      )),
    );
  }
}
