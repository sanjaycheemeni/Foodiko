import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
                  keyboardType:TextInputType.number,
                  controller: _phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Mobile no'
                  ),
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
            SizedBox(height: 50,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 10, 76, 131), borderRadius: BorderRadius.circular(8)),
              child: FlatButton(
                onPressed: () {
                  login(phone: _phone.text, password: _passw.text,context:context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
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

  Future<void> login({required String phone,required String password,required BuildContext context})async{
    
    await Firebase.initializeApp();

  if(phone.length != 10){
    SnackBar sn = SnackBar(content: Text('Invalid mobile no'));
    ScaffoldMessenger.of(context).showSnackBar(sn);
    return;
  }

    

  try {

    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: phone+"@foodiko.com",
    password: password);


    print("login success...");
  
  } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  
  }
}
