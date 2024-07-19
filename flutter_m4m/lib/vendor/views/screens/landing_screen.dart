import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_m4m/vendor/models/vendor_user_models.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final CollectionReference _vendorsStream =
        FirebaseFirestore.instance.collection('vendors');

    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
      stream: _vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        VendorUserModel vendorUserModel = VendorUserModel.fromJson(
            snapshot.data!.data()! as Map<String, dynamic>);
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              vendorUserModel.bussinessName.toString(),
            ),
          ],
        ));
      },
    ));
  }
}
