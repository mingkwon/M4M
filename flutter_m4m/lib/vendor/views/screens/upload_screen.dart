import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              child: Text("General"),
            ),
            Tab(
              child: Text("Shipping"),
            ),
            Tab(
              child: Text("Attributes"),
            ),
            Tab(
              child: Text("Images"),
            ),
          ]),
        ),
      ),
    );
  }
}
