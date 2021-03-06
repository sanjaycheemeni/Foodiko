import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiko/screens/screen_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final clr = Color.fromARGB(255, 26, 26, 26);
  final t_clr = Color.fromARGB(255, 135, 177, 255);
  final s_blk = Color.fromARGB(255, 37, 37, 37);
  final s_blk2 = Color.fromARGB(255, 71, 71, 71);

  bool isLoading = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    String _emailid = "0", _pass = "";

    return Scaffold(
      backgroundColor: s_blk,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 300,
              //color: Colors.red,
              width: double.maxFinite,
              child: Stack(
                
                children: [
                  Positioned(
                    top: 110,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 38,
                          color: t_clr,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Text(
                      'back',
                      style: TextStyle(
                        fontSize: 38,
                        color: t_clr,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    right: 1,
                    child: 
                  Image.asset('img/back_login.png',
                  height: 200,width: 150,color: Colors.white,)
                  )
                ],
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: s_blk2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "Email id",
                      fillColor: s_blk2),
                  onChanged: (String val) {
                    _emailid = val;
                    print(val);
                  },
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
                  color: s_blk2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  onChanged: (String val) {
                    _pass = val;
                    print(val);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
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
              height: 40,
              width: 240,
              decoration: BoxDecoration(
                  color: isLoading?t_clr.withOpacity(.2):t_clr.withOpacity(1), borderRadius: BorderRadius.circular(8)),
              child: FlatButton(
                onPressed: () {
                  
                  login(emailid: _emailid, password: _pass, context: context);
                  print("logi");
                  setState(() {
                    isLoading=true;
                  });
                },
                child: Text(
                  
                  isLoading?'Loading...':'Login',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 2,
                  color: s_blk2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 90,
                  height: 2,
                  color: s_blk2,
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 40,
              width: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: t_clr),
              ),
              child: FlatButton(
                onPressed: () {
                  //login(emailid: _emailid, password: _pass, context: context);
                  print("logi");
                  snack_success(context: context);
                },
                child: Text(
                  'Regitster',
                  style: TextStyle(
                    color: t_clr,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 65,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'foodiko',
                      style: TextStyle(
                          color: t_clr,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('canteen token management system',
                    style: TextStyle(
                          color: Color.fromARGB(255, 136, 136, 136),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<void> login(
    {required String emailid,
    required String password,
    required BuildContext context}) async {
  await Firebase.initializeApp();

 if(!emailid.contains('@') || !emailid.contains('.')){
   snack_inv_mob(context: context);
   setState(() {
     isLoading = false;
   });
   
  return;
 }
 if(password.length<8){
   snack_wrong_pass(context: context);
    setState(() {
     isLoading = false;
   });return;
 }


  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailid, password: password);

    print("login success...");
    snack_success(context: context);
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext bc) => Homepage()));
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      snack_wrong_user(context: context);
      setState(() {
        
        isLoading=false;
      });

      return;
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      snack_wrong_pass(context: context);
      setState(() {
        
        isLoading=false;
      });
      return;
    }
  }
}
}
/*

Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFEBEBEB)
              ),
            ),
          )

*/

void snack_success({
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 150,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 22, 133, 32),
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
                        "Welcome back",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                        ),
                      ),
                      Text(
                        "Login success!",
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
            left: 10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "img/tick.png",
                  height: 30,
                  width: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
               
              ],
            ),
          ),
        ],
      )));
}

void snack_inv_mob({
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 150,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 0, 34),
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
                        "Invalid email ID.",
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
            left: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "img/email.svg",
                  height: 30,
                  width: 30,
                  color: Color(0xFF801336),
                ),
                Positioned(
                  bottom: -1,
                  left: 15,
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

void snack_wrong_user({
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 150,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 0, 34),
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

void snack_wrong_pass({
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 150,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 0, 34),
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
