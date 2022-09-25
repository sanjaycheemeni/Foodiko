import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/database/FirebaseHive.dart';

class AdminNotify extends StatefulWidget {
  const AdminNotify({Key? key}) : super(key: key);

  @override
  State<AdminNotify> createState() => _AdminNotifyState();
}

class _AdminNotifyState extends State<AdminNotify> {
  String notval = "";
  //f//inal _c = TextEditingController();
  Color main_clr = Color.fromARGB(255, 82, 119, 187);
  var con = "";

  @override
  Widget build(BuildContext context) {
    notification();
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 40),
                child: Text(
                  'Notice Board',
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: main_clr),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 100,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 236, 236, 236)),
                    child: Stack(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 250,
                          height: 50,
                          //color: Colors.green,
                          //margin: EdgeInsets.only(left: 50, top: 12),
                          child: Text(
                            notval == "" ? "No Notification" : notval,
                            style: TextStyle(
                                fontSize: 18,
                                color: notval == "No Notification"
                                    ? Colors.red
                                    : main_clr,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
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
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 179, 179, 179)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            hintText: "Notification Message",
                            fillColor: Color.fromARGB(255, 219, 219, 219)),
                        onChanged: (String val) {
                          con = val;
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: main_clr),
                    onPressed: () {
                      updateValue(
                          colid: 'NoticeBoard',
                          docid: 'NOTIFICATION',
                          colname: 'content',
                          value: con);
                    },
                    child: Text('Update Notice Board'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: main_clr),
                    onPressed: () {
                      updateValue(
                          colid: 'NoticeBoard',
                          docid: 'NOTIFICATION',
                          colname: 'content',
                          value: "No Notification");
                    },
                    child: Text('Clear Notice Board'),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> notification() async {
    final val = await getNotify();
    if (this.mounted) {
      setState(() {
        notval = val;
      });
    }
    return;
  }
}
