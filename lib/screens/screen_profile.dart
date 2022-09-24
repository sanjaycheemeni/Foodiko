import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/screens/screen_login.dart';
import 'package:foodiko/screens/screen_wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final mail_id, name;
  const ProfilePage({Key? key, required this.mail_id, required this.name})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color main_clr = Color.fromARGB(255, 82, 119, 187);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(35),
        child: ListView(
          children: [
            Text(
              'Profile',
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                      offset: const Offset(0, 10))
                ],
                shape: BoxShape.circle,
              ),
              child: Image.asset('img/user.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.mail_id,
                  style: TextStyle(color: Color.fromARGB(255, 211, 211, 211)),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext bc) => WalletPage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 241, 241, 241)),
                child: Text(
                  "My Wallet",
                  style: TextStyle(
                      color: Color.fromARGB(255, 20, 20, 20), fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            new GestureDetector(
              onTap: () {
                logOut();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 255, 58, 44)),
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logOut() async {
    final sp = await SharedPreferences.getInstance();
    //sp.setBool('IS_LOGGED', true);
    sp.clear();

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ModalRoute.withName("/Home"));

    /// sp.getString(key)
  }
}
