import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/homePage.dart';
import 'package:messenger_app/loginPage.dart';
import 'package:messenger_app/productPage.dart';
import 'package:messenger_app/registerPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: Loginpage(),
      // home: Homepage(),
      home: Registerpage(),

      // home: Productpage(),
    );
  }
}

