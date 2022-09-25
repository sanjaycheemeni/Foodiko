import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/database/FirebaseHive.dart';
import 'package:foodiko/screens/screen_qr.dart';

class AdminOrder extends StatelessWidget {
  const AdminOrder({
    Key? key,
  }) : super(key: key);

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
                    ' Orders',
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
                                  child: ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            document['name'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: main_clr),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(document['user']),
                                          Text(
                                            document['time'],
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
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
                                            child: document['status'] ==
                                                    'DELIVERED'
                                                ? Image.asset(
                                                    'img/tick.png',
                                                    width: 25,
                                                    height: 25,
                                                    color: Colors.green,
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.asset(
                                                    'img/cross.png',
                                                    width: 25,
                                                    height: 25,
                                                    color: Colors.red,
                                                    fit: BoxFit.fill,
                                                  ),
                                          ),
                                        ],
                                      )),
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

  isMine(m, m1) {
    return m == m1 ? true : false;
  }
}
