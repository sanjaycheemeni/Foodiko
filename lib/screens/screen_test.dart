import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  
  
  
  String text_value = "null";



  @override
  Widget build(BuildContext context) {
    getValue();
    

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            text_value,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ));
  }


  //firebase realtime
  Future<void> getValue() async{

  //FirebaseDatabase database = FirebaseDatabase.instance;
  await Firebase.initializeApp();
  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
//   // FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);
//   DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

// await ref.set({
//   "name": "John",
//   "age": 18,
//   "address": {
//     "line1": "100 Mountain View"
//   }
// });

final ref = FirebaseDatabase.instance.ref();
final snapshot = await ref.child('users').get();
if (snapshot.exists) {
    print(snapshot.value);
    setState(() {
      text_value = snapshot.value.toString();
      var js = snapshot.value;
      
      
    });
} else {
    print('No data available.');
}



}



}