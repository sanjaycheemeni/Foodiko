import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/database/FirebaseHive.dart';

class AdminAddmoney extends StatefulWidget {
  final mailid;
  const AdminAddmoney({Key? key, required this.mailid}) : super(key: key);
  //print(this.mailid);

  @override
  State<AdminAddmoney> createState() => _AdminAddmoneyState();
}

class _AdminAddmoneyState extends State<AdminAddmoney> {
  String balance = "null";
  var value = "";

  String name = "Loading...";

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    print(widget.mailid);
    getBalance();
    welcome();
    Color main_clr = Color.fromARGB(255, 82, 119, 187);
    getBalance();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 40),
                  child: Text(
                    'Add Money',
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 85,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              widget.mailid,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
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
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 221, 221),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "Additional Amount in Rs.",
                      fillColor: Color.fromARGB(255, 219, 219, 219)),
                  onChanged: (String val) {
                    value = val;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 240,
              decoration: BoxDecoration(
                color: main_clr,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: main_clr),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: main_clr),
                onPressed: () async {
                  print(value);
                  if (value.isEmpty) {
                    setState(() {
                      isLoading = false;
                      return;
                    });
                  }
                  setState(() {
                    isLoading = true;
                  });
                  final cur_amnt = await getValue(
                      colid: 'User', docid: widget.mailid, colname: 'balance');
                  var amnt = double.parse(cur_amnt.toString());
                  int amnt1 = amnt.toInt();
                  print(amnt);
                  var bal;
                  try {
                    bal = int.parse(value) + amnt;
                    bal = int.parse(bal);
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                      return;
                    });
                  }

                  updateValue(
                      colid: 'User',
                      docid: widget.mailid,
                      colname: 'balance',
                      value: bal.toString());
                  getBalance();
                },
                child: Text(
                  !isLoading ? 'Update Wallet' : 'Loading...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Future<void> getBalance() async {
    final val = await getWalletbymail(widget.mailid);
    if (this.mounted) {
      setState(() {
        balance = "Rs " + val!.toString() + "";
      });
    }

    return;
  }

  Future<void> welcome() async {
    //setOnline();
    final n = await getNamebymail(widget.mailid);
    // n = name;
    if (this.mounted) {
      setState(() {
        name = n;
      });
    }
    return;
  }
}
