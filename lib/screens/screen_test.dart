import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {





  @override
  Widget build(BuildContext context) {
    final _phone = TextEditingController();
    final _passw = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 300),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 228, 228, 228),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                    filled: true,
                    hintText: "Mobile no",
                    fillColor: Color.fromARGB(255, 228, 228, 228)
              ),controller: _phone,
            ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 228, 228, 228),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _passw,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 10, 76, 131),
                  borderRadius: BorderRadius.circular(8)),
              child: FlatButton(
                onPressed: () {
              
                  login(
                      phone: _phone.text,
                      password: _passw.text,
                      context: context); 
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login(
      {required String phone,
      required String password,
      required BuildContext context}) async {

        snack_inv_email(context: context);
    await Firebase.initializeApp();

    // if (phone.length != 10) {
    //    
    //   return;
    // }

    try {
        print("login trying...");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "admin@foodik.com", password: "password");

      print("login success...");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        snack_wrong_user(context: context,);

      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

      }
    }
  }
}

void snack_inv_email({required BuildContext context,}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 150,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xFFC72C41),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Oh Snap!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                        ),
                      ),
                      Text(
                        "Invalid email id.",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'ProductSans',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "img/email.svg",
                  height: 32,
                  width: 32,
                  color: Color(0xFF801336),
                ),
                Positioned(
                  bottom: -1,
                  left: 18,
                  child: SvgPicture.asset(
                    "img/fail.svg",
                    color: Colors.white,
                    height: 15,
                    width: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      )));
}

void snack_wrong_user({required BuildContext context,}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 150,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xFFC72C41),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Oh Snap!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                        ),
                      ),
                      Text(
                        "User not found!",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'ProductSans',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "img/user.svg",
                  height: 40,
                  width: 40,
                  color: Color(0xFF801336),
                ),
                Positioned(
                  bottom: 1,
                  right: 2,
                  child: SvgPicture.asset(
                    "img/alert.svg",
                    color: Colors.white,
                    height: 15,
                    width: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      )));
}

void snack_wrong_pass({required BuildContext context,}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 150,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xFFC72C41),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Oh Snap!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                        ),
                      ),
                      Text(
                        "Wrong password!",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'ProductSans',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 8,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "img/key.svg",
                  height: 30,
                  width: 30,
                  color: Color(0xFF801336),
                ),
                Positioned(
                  bottom: 1,
                  right: 2,
                  child: SvgPicture.asset(
                    "img/alert.svg",
                    color: Colors.white,
                    height: 12,
                    width: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      )));
}