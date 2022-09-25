import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FriendList extends StatefulWidget {
  final mailid;

  const FriendList({Key? key, required this.mailid}) : super(key: key);

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    var ymd = DateFormat('yyyyMMdd').format(now);
    var h = int.parse(DateFormat('kk').format(now).toString()) * 360;
    var m = int.parse(DateFormat('mm').format(now).toString()) * 60;

    // print(ymd.toString() + h.toString() + m.toString());
    var v = int.parse(ymd.toString() + h.toString() + m.toString());
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
                    'Friends',
                    style: TextStyle(
                      color: Color.fromARGB(255, 95, 97, 245),
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
                        .orderBy('status', descending: false)
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
                                    trailing: (document['mailid'] ==
                                            widget.mailid)
                                        ? Text(
                                            'You',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(''),
                                    leading: Image.asset(
                                      'img/user.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    subtitle: Text(
                                      (v - int.parse(document['last_time'])) <
                                              1200
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
