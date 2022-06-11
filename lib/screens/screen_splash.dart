import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodiko/screens/screen_home.dart';
import 'package:foodiko/screens/screen_login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext bc)=>LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Text(
            'Foodiko',
            style: TextStyle(
              fontSize: 45,
              color: Color.fromARGB(255, 10, 39, 146),
              fontWeight: FontWeight.bold
            ),
          ), 
          Text('Canteen Token Management',
          style: TextStyle(fontSize: 15,color: Color(0xFFAFAFAF)),)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ));
  }
}
