import 'package:flutter/material.dart';
import 'package:messenger_app/homePage.dart';
import 'package:messenger_app/loginPage.dart';

void main() {
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
      home: Homepage(),
    );
  }
}

