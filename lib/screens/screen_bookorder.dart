import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/database/FoodikoDatabase.dart';

import '../database/FirebaseHive.dart';

class AdminBook extends StatefulWidget {
  String fid, price, fname, status, id;
  AdminBook(
      {Key? key,
      required this.fid,
      required this.fname,
      required this.status,
      required this.price,
      required this.id})
      : super(key: key);

  @override
  State<AdminBook> createState() => _AdminBookState();
}

class _AdminBookState extends State<AdminBook> {
  var ready = false;
  String balance = "00";

  final total_price = "00";
  @override
  Widget build(BuildContext context) {
    getBalance();
    Color mainClr = Color.fromARGB(255, 82, 119, 187);
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
                  'Book Order',
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: mainClr),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Your balance : Rs.' + balance + '.0',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  right: 25,
                  left: 25,
                ),
                child: Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 233, 233, 233)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.fname + '\nQty: 1nos',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 250,
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Total price : ' + widget.price,
                          style: TextStyle(color: mainClr, fontSize: 20),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: (widget.status != "available")
                                  ? mainClr.withOpacity(0)
                                  : mainClr),
                          onPressed: () {
                            orderConfirm();
                          },
                          child: Text(
                            'Confirm Booking',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              ready ? '' : 'Insufficent Amount, Cant book your order',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              widget.status == "available" ? '' : 'Currently Not Available!',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> getBalance() async {
    final val = await getWallet();
    isPos();

    if (this.mounted) {
      setState(() {
        balance = val;
      });
    }

    return;
  }

  void isPos() {
    var b;
    if (double.parse(balance) < double.parse(widget.price))
      b = false;
    else
      b = true;

    // print(
    //     'check balance ->' + b.toString() + '/' + balance + '-' + widget.price);

    if (this.mounted) {
      setState(() {
        ready = b;
      });
    }
  }

  orderConfirm() {
    if (ready) {
      var i = createOrder(
          mailid: widget.id,
          fname: widget.fname,
          foodid: widget.fid,
          price: widget.price);

      if (i == 0) {
        print('done');
      }
    } else {}
  }
}
