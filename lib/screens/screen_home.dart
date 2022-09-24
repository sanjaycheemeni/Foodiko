import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiko/database/FirebaseHive.dart';
import 'package:foodiko/screens/screen_friends.dart';
import 'package:foodiko/screens/screen_myorder.dart';
import 'package:foodiko/screens/screen_order.dart';
import 'package:foodiko/screens/screen_profile.dart';
import 'package:foodiko/screens/screen_wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  final String mail_id;

  Homepage({Key? key, required String this.mail_id}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String welcome_msg = "";
  String n = "";
  String notification_msg = "No Notification";

  @override
  Widget build(BuildContext context) {
    welcome();
    notification();
    Color main_clr = Color.fromARGB(255, 82, 119, 187);
    final size = MediaQuery.of(context).size;
    final clr = Color.fromARGB(255, 255, 255, 255);
    final t_clr = Color.fromARGB(255, 135, 177, 255);
    final s_blk = Color.fromARGB(255, 238, 238, 238);
    final s_blk2 = Color.fromARGB(255, 190, 190, 190);

    //var box =  Hive.openBox('testBox');
    // var str = box.get()

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: main_clr,
        //backgroundColor: C,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        onPressed: () {
          // Respond to button press
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext bc) => OrderPage()));
        },
        icon: Image.asset(
          'img/book.png',
          width: 50,
          height: 55,
          color: Colors.white,
          fit: BoxFit.fill,
        ),
        label: Text(
          'BOOK',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 2,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: clr,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              width: 100,
              height: 50,
              color: clr,
              margin: EdgeInsets.only(left: 35, right: 35, top: 2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "img/menu.svg",
                      width: 15,
                      height: 15,
                      color: Color.fromARGB(255, 204, 204, 204),
                    ),
                    Text(
                      "foodiko",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: main_clr),
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext bc) => ProfilePage(
                                  name: n,
                                  mail_id: widget.mail_id,
                                )));
                      },
                      child: SvgPicture.asset("img/user_round.svg",
                          width: 20,
                          height: 20,
                          color: Color.fromARGB(255, 204, 204, 204)),
                    )
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5),
              child: Text(
                welcome_msg,
                style: TextStyle(fontSize: 20, color: main_clr),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: size.width * .8,
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
                      notification_msg == ""
                          ? "No Notification"
                          : notification_msg,
                      style: TextStyle(
                          fontSize: 18,
                          color: notification_msg == "No Notification"
                              ? Colors.red
                              : main_clr,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
              width: 200,
              height: 2,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 71, 71, 71),
                  borderRadius: BorderRadius.circular(10)),
            ),
            //===================
            tab(img: "img/wallet.svg", name: "Wallet", context: context),
            tab(img: "img/menu.svg", name: "My Orders", context: context),
            tab(img: "img/friends.svg", name: "My Friends", context: context),
            tab(img: "img/review.svg", name: "Reviews", context: context),
          ],
        ),
      ),
    );
  }

  GestureDetector tab(
      {required String img,
      required String name,
      required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        if (name == "My Friends") {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext bc) => FriendList()));
        }
        if (name == "Wallet") {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext bc) => WalletPage()));
        }
        if (name == "My Orders") {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext bc) => MyOrder()));
        }
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.fromLTRB(25, 15, 25, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 230, 230, 230),
          boxShadow: [
            BoxShadow(
                spreadRadius: 0,
                blurRadius: 2,
                color: Color.fromARGB(255, 34, 34, 34).withOpacity(0.1),
                offset: const Offset(0, 10))
          ],
        ),
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: 15,
          ),
          SvgPicture.asset(
            img,
            height: 30,
            width: 30,
            color: Color.fromARGB(255, 3, 14, 71),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            name,
            style: TextStyle(
                color: Color.fromARGB(255, 66, 66, 66),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }

  Future<void> welcome() async {
    final name = await getName('a@b.com');
    n = name;
    setState(() {
      welcome_msg = "hello " + name + "!";
    });
    return;
  }

  Future<void> notification() async {
    final val = await getNotify();
    setState(() {
      notification_msg = val;
    });
    return;
  }
}
