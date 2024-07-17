import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Customer"s Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Email Address',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
