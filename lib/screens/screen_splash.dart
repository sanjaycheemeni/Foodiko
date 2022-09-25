import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:foodiko/screens/screen_admin_home.dart';
import 'package:foodiko/screens/screen_home.dart';
import 'package:foodiko/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Color main_clr = Color.fromARGB(255, 82, 119, 187);
  @override
  void initState() {
    // TODO: implement initState

    isUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Stack(
        children: [
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: Text(
                    'foodiko',
                    style: TextStyle(
                        color: Color.fromARGB(255, 82, 119, 187),
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Canteen token management system',
                  style: TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
                ),
              ],
            ),
          ),
          // Positioned(child: Image.asset('img/bac.png',width: 200,color: Color.fromARGB(255, 49, 49, 49)),
          // top: 10,
          // left: 10,
          // ),
          // Positioned(child: Image.asset('img/bac2.png',width: 200,color: Color.fromARGB(255, 46, 46, 46),),
          // top: 540,
          // left: 150,
          // )
        ],
      ),
    ));
  }

  Future<void> isUserLoggedIn() async {
    final sp = await SharedPreferences.getInstance();
    final isLogged = sp.getBool('IS_LOGGED');
    final mid = await sp.getString('MAILID');
    print(isLogged);

    Future.delayed(Duration(seconds: 5));

    if (isLogged == null || isLogged == false) {
      print('loginnnc');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext bc) => LoginPage()));
    } else {
      print('home');
      if (mid == 'admin@foodiko.com') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext bc) => AdminHome()));
        return;
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext bc) => Homepage(
                mail_id: mid!,
              )));
    }
  }

  Future<String?> getMail() async {
    final sp = await SharedPreferences.getInstance();
    // final isLogged = sp.setBool('IS_LOGGED', true);
    // final mail = sp.setString('MAILID',emailid);
    return await sp.getString('MAILID');
  }
}
