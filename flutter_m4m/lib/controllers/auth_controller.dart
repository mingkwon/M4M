import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  _uploadProfileImageToStorage(Uint8List? image) async {
    Reference ref = _storage.ref().child('profilePics').child(DateTime.now().millisecondsSinceEpoch.toString());

    UploadTask uploadTask = ref.putData(image!);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image Selected');
    }
  }

  Future<String> signUpUsers(String email, String fullName, String phoneNumber, String password, Uint8List? image) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty && fullName.isNotEmpty && phoneNumber.isNotEmpty && password.isNotEmpty && image != null) {
        // Generate a unique document ID for the new user
        String userId = _firestore.collection('buyers').doc().id;

        String profileImageUrl = await _uploadProfileImageToStorage(image);

        await _firestore.collection('buyers').doc(userId).set({
          'email': email,
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'buyerId': userId,
          'address': '',
          'profileImage': profileImageUrl,
        });

        res = 'success';
      } else {
        res = 'Please Fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  loginUsers(String email, String password) async {
    // This part remains the same as before
    String res = 'something went wrong';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // Add login logic here
        res = 'success';
      } else {
        res = 'Please Fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}