

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName ='\CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      child: 
                       Center(
                        child: Text('image'),
                      ),
                    ),
                    SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: (){

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
                    decoration: InputDecoration(
                
                      hintText: 'Name Category',
                    ),
                  ),
                ),
              ),
              

              ElevatedButton(
                onPressed: (){
                  
                }, 
                child: Text('Save'),
              ),
            ],
            ),
          ],
        ),
      );
  }
}