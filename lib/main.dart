import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodiko/screens/screen_dec_page.dart';
import 'package:foodiko/screens/screen_home.dart';
import 'package:foodiko/screens/screen_login.dart';
import 'package:foodiko/screens/screen_profile.dart';
import 'package:foodiko/screens/screen_register.dart';
import 'package:foodiko/screens/screen_splash.dart';
import 'package:foodiko/screens/screen_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{

  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');
  box.put('name', 'David');
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
      home:Splash(),
    );
  }

  

}
