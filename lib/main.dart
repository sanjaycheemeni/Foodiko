import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodiko/database/FirebaseHive.dart';
import 'package:foodiko/database/FoodikoDatabase.dart';
import 'package:foodiko/screens/screen_admin_foodlist.dart';
import 'package:foodiko/screens/screen_admin_notification.dart';
import 'package:foodiko/screens/screen_friends.dart';
import 'package:foodiko/screens/screen_home.dart';
import 'package:foodiko/screens/screen_myorder.dart';
import 'package:foodiko/screens/screen_order.dart';
import 'package:foodiko/screens/screen_qr.dart';
import 'package:foodiko/screens/screen_register.dart';
import 'package:foodiko/screens/screen_splash.dart';
import 'package:foodiko/screens/screen_wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  fetchLeaderBoard();
  getData();

  // await Hive.initFlutter();
  // var box = await Hive.openBox('testBox');
  // box.put('name', 'David');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.=
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ProductSans'),
      title: 'Flutter Demo',
      home: Splash(),
    );
  }
}
