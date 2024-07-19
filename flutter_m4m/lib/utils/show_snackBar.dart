import 'package:flutter/material.dart';

showSnack(context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color.fromARGB(255, 152, 1, 1),
      content: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
