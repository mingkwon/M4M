import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class VendorController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // FUNTION TO STORE IMAGE IN FIREBASE STORAGE

  _uploadVendorImageToStorage(image) async {
    Reference ref =
        _storage.ref().child('storeImage').child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);

    TaskSnapshot snapshot = await uploadTask;

    String dowloadUrl = await snapshot.ref.getDownloadURL();
    return dowloadUrl;
  }
  //END

  // FUNTION PICK STORE IMAGE
  pickStoreImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No image Selected");
    }
  }

  //END

  // FUNTION TO SAVE VENDOR DATA

  Future<String> registerVendor(
    String bussinessName,
    String email,
    String phoneNumber,
    String stateValue,
    String cityValue,
    String countryValue,
    String taxRegistered,
    String taxNumber,
    Uint8List? image,
  ) async {
    String res = 'some error occured';
    try {
      
        //save data to cloud firestore
        String storeImage = await _uploadVendorImageToStorage(image);
        await _firestore.collection("vendors").doc(_auth.currentUser!.uid).set({
          "bussinessName": bussinessName,
          "email": email,
          "PhoneNumber": phoneNumber,
          "countryValue": countryValue,
          "stateValue": stateValue,
          "cityValue": cityValue,
          "taxRegisted": taxRegistered,
          "taxNumber": taxNumber,
          "storeImage": storeImage,
          "approved": false,
        });
      
      ;
    } catch (e) {
      res = e.toString();
    }
    return res;
    //SAVE DATA ENDS
  }
}
