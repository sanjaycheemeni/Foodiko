import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String _emailid= "0", _pass = "";

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
                      hintText: "Email id",
                      fillColor: Color.fromARGB(255, 228, 228, 228)),
                  onChanged: (String val) {
                   _emailid=val;
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
                  color: Color.fromARGB(255, 228, 228, 228),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (String val) {
                   _pass=val;
                   print(val);
                  },
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
                      emailid: _emailid,
                      password: _pass,
                      context: context);
                      print("logi");
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

Future<void> login(
    {required String emailid,
    required String password,
    required BuildContext context}) async {
  await Firebase.initializeApp();

  //email validation
  print("checking");

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailid, password: password);

    print("login success...");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
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
                        "Invalid mobile no.",
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
                  "img/mobile.svg",
                  height: 40,
                  width: 40,
                  color: Color(0xFF801336),
                ),
                Positioned(
                  bottom: 16,
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
