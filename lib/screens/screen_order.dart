import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
                  padding: const EdgeInsets.only(top: 35.0, left: 35),
                  child: Text(
                    'Foods',
                    style: TextStyle(
                      color: Color.fromARGB(255, 95, 97, 245),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text(
                    'Click to book your order',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Food")
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
                                  child: GestureDetector(
                                    onTap: () {
                                      print(document['price']);
                                    },
                                    child: ListTile(
                                      trailing: Text(document['price']),
                                      title: Text(document['name']),
                                      leading: Image.asset(
                                        'img/food.png',
                                        width: 40,
                                        height: 40,
                                        color: Colors.grey,
                                      ),
                                      subtitle: Text(
                                        document['status'] == 'available'
                                            ? 'Ready to book'
                                            : 'Not Available',
                                        style: TextStyle(
                                            color: document['status'] ==
                                                    'available'
                                                ? Colors.green
                                                : Colors.red),
                                      ),
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
