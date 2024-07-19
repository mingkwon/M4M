import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_m4m/vendor/views/auth/vendor_auth.dart';
<<<<<<< HEAD
import 'package:flutter_m4m/vendor/views/screens/main_vendor_screen.dart';
=======
import 'package:flutter_m4m/views/buyers/auth/begin_screen.dart';
>>>>>>> f7ba5b199ed4a755e167f98c01a7964aeb12bd84
import 'package:flutter_m4m/views/buyers/auth/register_screen.dart';
import 'package:flutter_m4m/views/buyers/main_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyARhMDY2KkqC0kmtICrL7A6Fsuf_jLEWjg",
      appId: "1:745707625175:android:9615b137c721ddebe42e92",
      messagingSenderId: "745707625175",
      projectId: "m4m-app-2b73d",
      storageBucket: "m4m-app-2b73d.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Thiết lập màu xanh cho status bar
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

<<<<<<< HEAD
      home: MainVendorScreen(),
=======
      home: BeginScreen(),
>>>>>>> f7ba5b199ed4a755e167f98c01a7964aeb12bd84
      builder: EasyLoading.init(),

    );
  }
}
