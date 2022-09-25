import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/database/FirebaseHive.dart';
import 'package:foodiko/screens/screen_admin_home.dart';

class AdminDeliver extends StatefulWidget {
  final oid;
  const AdminDeliver({Key? key, required this.oid}) : super(key: key);

  @override
  State<AdminDeliver> createState() => _AdminDeliverState();
}

class _AdminDeliverState extends State<AdminDeliver> {
  var notval = "";

  var name = "";

  var fname = "";

  var price = "";

  var status = "";

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    Color main_clr = Color.fromARGB(255, 82, 119, 187);
    updateDel();
    print('orderid - ' + widget.oid);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: main_clr,
        //backgroundColor: C,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        onPressed: () async {
          if (this.mounted) {
            setState(() {
              isLoading = true;
            });
          }
          int i = -1, j = -1;

          i = await updateValue(
              colid: 'Order',
              docid: widget.oid,
              colname: 'status',
              value: 'DELIVERED');
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

          var ymd = DateFormat('yyyyMMdd').format(now);
          var h = int.parse(DateFormat('kk').format(now).toString()) * 360;
          var m = int.parse(DateFormat('mm').format(now).toString()) * 60;

          // print(ymd.toString() + h.toString() + m.toString());
          var v = int.parse(ymd.toString() + h.toString() + m.toString());

          j = await updateValue(
              colid: 'User',
              docid: await getValue(
                  colid: 'Order', docid: widget.oid, colname: 'mailid'),
              colname: 'last_time',
              value: v.toString());

          if (i == 0) {
            snack_success(context: context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AdminHome()),
                ModalRoute.withName("/Home"));
          } else {
            snack_failed(context: context);
            setState(() {
              isLoading = false;
            });
          }
        },
        // icon: Image.asset(
        //   'img/qrcode.png',
        //   width: 25,
        //   height: 25,
        //   color: Colors.white,
        //   fit: BoxFit.fill,
        // ),
        label: Text(
          isLoading ? 'Loading..' : 'Confirm Order',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 2,
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
              alignment: Alignment.center,
              child: Text(
                'Order Details',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 34, 34, 34)),
              )),
          SizedBox(
            height: 15,
          ),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 150,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 236, 236, 236)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Name: ',
                        style: TextStyle(
                            fontSize: 18,
                            color: main_clr,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        name == "" ? "" : name,
                        style: TextStyle(
                            fontSize: 18,
                            color: main_clr,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Food : ',
                        style: TextStyle(
                            fontSize: 18,
                            color: main_clr,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        fname == "" ? "" : fname,
                        style: TextStyle(
                            fontSize: 18,
                            color: main_clr,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Price: ',
                        style: TextStyle(
                            fontSize: 18,
                            color: main_clr,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        price == "" ? "" : price,
                        style: TextStyle(
                            fontSize: 18,
                            color: main_clr,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Status : ',
                        style: TextStyle(
                            fontSize: 18,
                            color: main_clr,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        name == "" ? "" : name,
                        style: TextStyle(
                            fontSize: 18,
                            color: main_clr,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void updateDel() async {
    var nam =
        await getValue(colid: 'Order', docid: widget.oid, colname: 'user');
    var fn = await getValue(colid: 'Order', docid: widget.oid, colname: 'name');
    var pr =
        await getValue(colid: 'Order', docid: widget.oid, colname: 'price');
    var stat =
        await getValue(colid: 'Order', docid: widget.oid, colname: 'status');
    if (this.mounted) {
      setState(() {
        name = nam;
        fname = fn;
        price = pr;
        status = stat;
      });
    }
  }
}

void snack_success({
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
                color: Color.fromARGB(255, 22, 133, 32),
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
                        "Success!!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                        ),
                      ),
                      Text(
                        "Order Delivered Successfuly!",
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
            left: 10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "img/tick.png",
                  height: 30,
                  width: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
          ),
        ],
      )));
}

void snack_failed({
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
                color: Color.fromARGB(255, 223, 40, 7),
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
                        "Try again!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                        ),
                      ),
                      Text(
                        "Something went wrong!",
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
            left: 10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "img/cross.png",
                  height: 30,
                  width: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
          ),
        ],
      )));
}
