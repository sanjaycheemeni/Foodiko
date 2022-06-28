import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodiko/screens/screen_dec_page.dart';
import 'package:foodiko/screens/screen_login.dart';
import 'package:foodiko/screens/screen_splash.dart';
import 'package:foodiko/screens/screen_test.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ProductSans'),
      title: 'Flutter Demo',
      home:SamplePage(),
    );
  }
}
