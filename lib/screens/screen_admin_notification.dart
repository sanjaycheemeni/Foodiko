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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 40),
                child: Text(
                  'Notice Board',
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
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
                  TextField(
                    onChanged: (value) {
                      con = value;
                    },
                  ),
                  ElevatedButton(
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
