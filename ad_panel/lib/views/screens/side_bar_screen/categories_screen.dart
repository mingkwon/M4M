

import 'package:ad_panel/views/screens/side_bar_screen/widgets/category_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName ='\CategoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  dynamic _image;

  String? fileName ;
  late String categoryName;

  _pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

        if (result!=null) {
          setState(() {
            _image = result.files.first.bytes;

            fileName = result.files.first.name;
          });
        }
        
  }

  uploadCategoryToStorage(dynamic image)async{
    Reference ref =  _storage.ref().child('categoryImages').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  uploadCategory()async{
    EasyLoading.show();
    if (_formKey.currentState!.validate()) {
      String imageUrl = await uploadCategoryToStorage(_image);
      await _firestore.collection('categories').doc(fileName).set({
        'image': imageUrl,
        'categoryName': categoryName,
      }).whenComplete((){
        EasyLoading.dismiss();
        setState(() {
          _image = null;
          _formKey.currentState!.reset();
        });
      });
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Categories',
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
                          child: Text('image'),
                        ),
                      ),
                      SizedBox(height: 20,),
          
                      ElevatedButton(
                        onPressed: (){
                          _pickImage();
                        }, 
                        child: Text('Add image'),
                      ),
                    ],
                  ),
                ),
          
                Flexible(
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      onChanged: (value){
                        categoryName = value;
                      },
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Please enter category name';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(   
                        hintText: 'Name Category',
                      ),
                    ),
                  ),
                ),
                
          
                ElevatedButton(
                  onPressed: (){
                    uploadCategory();
                  }, 
                  child: Text('Save'),
                ),
              ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(color: Colors.grey,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  
                ),
              ),
              CategoryWidget(),
            ],
          ),
        ),
      );
  }
}