import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../database/FirebaseHive.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String balance = "null";

  @override
  Widget build(BuildContext context) {
    getBalance();
    Color main_clr = Color.fromARGB(255, 82, 119, 187);
    getBalance();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 40),
                child: Text(
                  'Wallet',
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 100,
              right: 25,
              left: 25,
            ),
            child: Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 233, 233, 233)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remaining balance ',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      balance == "null" ? "Calculating..." : balance,
                      style: TextStyle(color: main_clr, fontSize: 30),
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }

  Future<void> getBalance() async {
    final val = await getWallet();
    if (this.mounted) {
      setState(() {
        balance = "Rs " + val!.toString() + ".0";
      });
    }

    return;
  }
}
