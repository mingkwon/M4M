import 'package:flutter/material.dart';
import 'package:flutter_m4m/vendor/views/screens/upload_tab_screens/general_screen.dart';
import 'package:flutter_m4m/vendor/views/screens/upload_tab_screens/shipping_screen.dart';
import 'package:flutter_m4m/vendor/views/screens/upload_tab_screens/attributes_tab_screen.dart';
import 'package:flutter_m4m/vendor/views/screens/upload_tab_screens/images_tab_screen.dart';
import 'package:flutter_m4m/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class UploadScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return DefaultTabController(
        length: 4,
        child: Form(
          key: _formKey,
          child: Scaffold(
              appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 152, 1, 1),
                  elevation: 0,
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        child: Text('General'),
                      ),
                      Tab(
                        child: Text('Shipping'),
                      ),
                      Tab(
                        child: Text('Attributes'),
                      ),
                      Tab(
                        child: Text('Images'),
                      ),
                    ],
                  )),
              body: TabBarView(
                children: [
                  GeneralScreen(),
                  ShippingScreen(),
                  AttributesTabScreen(),
                  ImagesTabScreen(),
                ],
              ),
              bottomSheet: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    overlayColor: Color.fromARGB(255, 152, 1, 1),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final productId = Uuid().v4();
                      await _firestore
                          .collection('products')
                          .doc(productId)
                          .set({
                        'productId': productId,
                        'productName':
                            _productProvider.productData['productName'],
                        'productPrice':
                            _productProvider.productData['productData'],
                        'quantity': _productProvider.productData['quantity'],
                        'category': _productProvider.productData['category'],
                        'description':
                            _productProvider.productData['description'],
                        'imageUrlList':
                            _productProvider.productData['imageUrlList'],
                        'schedualDate':
                            _productProvider.productData['schedualDate'],
                        'chargeShipping':
                            _productProvider.productData['chargeShipping'],
                        'shippingCharge':
                            _productProvider.productData['shippingCharge'],
                        'brandName': _productProvider.productData['brandName'],
                        'sizeList': _productProvider.productData['sizeList'],
                      });
                    }
                  },
                  child: Text('Save'),
                ),
              )),
        ));
  }
}
