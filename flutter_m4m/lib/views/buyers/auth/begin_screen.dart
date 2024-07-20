import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m4m/vendor/views/auth/vendor_auth.dart';
import 'package:flutter_m4m/views/buyers/auth/register_screen.dart';

class BeginScreen extends StatefulWidget {
  const BeginScreen({super.key});

  @override
  State<BeginScreen> createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/logo.png', // Đường dẫn đến tệp ảnh logo
            //   width: 150,
            //   height: 150,
            // ),
            SizedBox(height: 20),
            Text(
              'Who are you?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Điều hướng đến VendorAuthScreen()
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VendorAuthScreen()),
                    );
                  },
                  child: Text('Vendor'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Điều hướng đến RegisterScreen()
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Customer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}