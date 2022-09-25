import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/screens/screen_admin_addmoney.dart';

class Adminusers extends StatefulWidget {
  final mailid;
  const Adminusers({Key? key, this.mailid}) : super(key: key);

  @override
  State<Adminusers> createState() => _AdminusersState();
}

class _AdminusersState extends State<Adminusers> {
  Color main_clr = Color.fromARGB(255, 82, 119, 187);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    try {
      return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                    'Users List',
                    style: TextStyle(
                      color: main_clr,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("User")
                        .orderBy('name', descending: false)
                        .snapshots(),
                    builder: ((context, snapshot) {
                      try {
                        if (snapshot.hasData) {
                          return Expanded(
                              child: ListView(
                            children: snapshot.data!.docs.map((document) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  child: ListTile(
                                    title: Text(document['name']),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext bc) =>
                                                    AdminAddmoney(
                                                      mailid:
                                                          document['mailid'],
                                                    )));
                                      },
                                      child: Text(
                                        'Add Money',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 1, 140, 255)),
                                      ),
                                    ),
                                    leading: Image.asset(
                                      'img/user.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    subtitle: Text(
                                      document['status'] == 'online'
                                          ? 'in Canteen'
                                          : '',
                                      style: TextStyle(
                                          color: document['status'] == 'online'
                                              ? Colors.green
                                              : Colors.red),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ));
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                      return Text('Loading...');
                    })),
              ],
            ),
          ),
        ),
      );
    }
    // ignore: empty_catches
    catch (e) {
      print(e.toString());
      return Scaffold(
        body: SafeArea(
            child: Container(
          width: 500,
          height: 100,
          color: Colors.red,
        )),
      );
    }
  }
}
