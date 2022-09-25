import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiko/screens/screen_admin_home.dart';
import 'package:foodiko/screens/screen_home.dart';
import 'package:foodiko/screens/screen_register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color main_clr = Color.fromARGB(255, 82, 119, 187);
  final clr = Color.fromARGB(255, 255, 255, 255);
  final t_clr = Color.fromARGB(255, 135, 177, 255);
  final s_blk = Color.fromARGB(255, 226, 226, 226);
  final s_blk2 = Color.fromARGB(255, 224, 224, 224);

  bool isLoading = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    // if(islogged()){
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (BuildContext bc) => Homepage()));
    // }

    String _emailid = "0", _pass = "";

    return Scaffold(
      backgroundColor: Colors.white,
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
                          color: main_clr,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Text(
                      'back',
                      style: TextStyle(
                        fontSize: 38,
                        color: main_clr,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 110,
                      right: 15,
                      child: Image.asset(
                        'img/back_login.png',
                        height: 200,
                        width: 150,
                        color: Color.fromARGB(255, 29, 29, 29),
                      ))
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
                  style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
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
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  cursorColor: Color.fromARGB(255, 37, 37, 37),
                  onChanged: (String val) {
                    _pass = val;
                    print(val);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
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
                  color: isLoading
                      ? t_clr.withOpacity(.2)
                      : main_clr.withOpacity(1),
                  borderRadius: BorderRadius.circular(8)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: main_clr),
                onPressed: () {
                  login(emailid: _emailid, password: _pass, context: context);
                  print("logi");
                  setState(() {
                    isLoading = true;
                  });
                },
                child: Text(
                  isLoading ? 'Loading...' : 'Login',
                  style: TextStyle(
                    color: Color.fromARGB(255, 233, 233, 233),
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
                    style: TextStyle(color: Color.fromARGB(255, 51, 114, 230)),
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
                color: main_clr,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: main_clr),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: main_clr),
                onPressed: () {
                  //login(emailid: _emailid, password: _pass, context: context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext bc) => RegisterPage()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 65,
            ),
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

    if (!emailid.contains('@') || !emailid.contains('.')) {
      snack_inv_mob(context: context);
      setState(() {
        isLoading = false;
      });

      return;
    }
    if (password.length < 8) {
      snack_wrong_pass(context: context);
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailid, password: password);

      print("login success...");
      final sp = await SharedPreferences.getInstance();
      final isLogged = sp.setBool('IS_LOGGED', true);
      final mail = sp.setString('MAILID', emailid);
      snack_success(context: context);

      Timer(Duration(seconds: 2), () {
        if (emailid == 'admin@foodiko.com') {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext bc) => AdminHome()));
          return;
        }
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext bc) => Homepage(
                  mail_id: emailid,
                )));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        snack_wrong_user(context: context);
        setState(() {
          isLoading = false;
        });

        return;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        snack_wrong_pass(context: context);
        setState(() {
          isLoading = false;
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
// loggedIn() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('LOGIN', true);
//   return;
// }
// islogged() async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   if("true" == prefs.getString('isLogged')){
//     return true;
//   }
//   return false;
// }