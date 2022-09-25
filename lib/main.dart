import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodiko/database/FirebaseHive.dart';
import 'package:foodiko/database/FoodikoDatabase.dart';
import 'package:foodiko/screens/screen_admin_addmoney.dart';
import 'package:foodiko/screens/screen_admin_deliverpage.dart';
import 'package:foodiko/screens/screen_admin_foodlist.dart';
import 'package:foodiko/screens/screen_admin_home.dart';
import 'package:foodiko/screens/screen_admin_notification.dart';
import 'package:foodiko/screens/screen_admin_scanqr.dart';
import 'package:foodiko/screens/screen_admin_users.dart';
import 'package:foodiko/screens/screen_friends.dart';
import 'package:foodiko/screens/screen_home.dart';
import 'package:foodiko/screens/screen_myorder.dart';
import 'package:foodiko/screens/screen_order.dart';
import 'package:foodiko/screens/screen_qr.dart';
import 'package:foodiko/screens/screen_register.dart';
import 'package:foodiko/screens/screen_splash.dart';
import 'package:foodiko/screens/screen_wallet.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print(getElapsedCrntTime().toString());

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
        home: Splash());
  }
}

getElapsedCrntTime() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  var ymd = DateFormat('yyyyMMdd').format(now);
  var h = int.parse(DateFormat('kk').format(now).toString()) * 360;
  var m = int.parse(DateFormat('mm').format(now).toString()) * 60;

  // print(ymd.toString() + h.toString() + m.toString());
  return int.parse(ymd.toString() + h.toString() + m.toString());
}
