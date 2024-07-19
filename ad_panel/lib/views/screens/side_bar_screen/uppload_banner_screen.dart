

import 'package:ad_panel/views/screens/side_bar_screen/widgets/banner_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String routeName ='\UploadBannerScreen';

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  dynamic _image;

  String? fileName ;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

        if (result!=null) {
          setState(() {
            _image = result.files.first.bytes;

            fileName = result.files.first.name;
          });
        }
  }

  uploadBannerToStorage(dynamic image) async{
   Reference ref = _storage.ref().child('Banners').child(fileName!);

   UploadTask uploadTask = ref.putData(image);
   TaskSnapshot snapshot =  await uploadTask;
   String downloadURL = await snapshot.ref.getDownloadURL();
   return downloadURL;
  }

  uploadBannerToFirestore() async{
    EasyLoading.show();
    if (_image!=null) {
      String imageUrl = await uploadBannerToStorage(_image);
      await _firestore.collection('banners').doc(fileName).set({
        'image': imageUrl,
      }).whenComplete((){
        EasyLoading.dismiss();
        setState(() {
          _image = null;
        });
      });
    }
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
                'Upload banners',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),

            Divider(
              color: Colors.grey,
            ),
            
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                    
                        border: Border.all(color: Colors.grey.shade700),
                        borderRadius: BorderRadius.circular(20)
                    
                      ),
                      child: _image != null ? Image.memory(_image, fit: BoxFit.cover,) :
                       Center(
                        child: Text('Banners'),
                      ),
                    ),
                    SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: (){
                        pickImage();
                      }, 
                      child: Text('Add image'),
                    ),
                  ],
                ),
              ),
              

              ElevatedButton(
                onPressed: (){
                  uploadBannerToFirestore();
                }, 
                child: Text('Save'),
              ),
            ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.grey,),
            ),
            BannerWidgets(),
          ],
        ),
      );
  }
}