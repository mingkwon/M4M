import 'dart:io';

import 'package:ad_panel/views/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid
          ? FirebaseOptions(
              apiKey: "AIzaSyARhMDY2KkqC0kmtICrL7A6Fsuf_jLEWjg", 
              appId: "1:745707625175:android:9615b137c721ddebe42e92", 
              messagingSenderId: "745707625175", 
              projectId: "m4m-app-2b73d",
              storageBucket: "m4m-app-2b73d.appspot.com",
            )
          : null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.red,
      ),
      home:MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}

