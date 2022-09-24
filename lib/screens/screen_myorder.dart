import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/screens/screen_qr.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color main_clr = Color.fromARGB(255, 82, 119, 187);
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
                    'My Orders',
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
                        .collection("Order")
                        .orderBy('status', descending: true)
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  child: (true)
                                      ? ListTile(
                                          title: Text(document['orderid']),
                                          subtitle: Text(
                                            document['status'] == 'DELIVERED'
                                                ? 'Already Delivered'
                                                : '',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          trailing: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              bc) =>
                                                          QRpage(
                                                              id: document[
                                                                  'tokenid'],
                                                              status: document[
                                                                  'status'])));
                                            },
                                            child: Image.asset(
                                              'img/qrcode.png',
                                              width: 25,
                                              height: 25,
                                              color: main_clr,
                                              fit: BoxFit.fill,
                                            ),
                                          ))
                                      : null,
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
