

import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  static const String routeName ='\VendorScreen';


  Widget _rowHeader(String text, int flex){
    return Expanded(
      flex: flex,
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Color.fromARGB(255, 215, 0, 0),
      ),
      child: Text(
        text, 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),


    ));
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Vendors',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),

            Row(children: [
              _rowHeader('LOGO', 1),
              _rowHeader('NAME', 3),
              _rowHeader('CITY', 2),
              _rowHeader('SATE', 2),
              _rowHeader('ACTION', 1),
              _rowHeader('MORE', 1),
            ],)
          ],
        ),
      );
  }
}