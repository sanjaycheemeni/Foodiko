import 'package:flutter/material.dart';
import 'package:foodiko/database/FoodikoDatabase.dart';
import 'package:foodiko/screens/screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String reg = "";
  String name = "", mail = "", pass = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Color main_clr = Color.fromARGB(255, 82, 119, 187);
    final size = MediaQuery.of(context).size;

    final con_clr = Color.fromARGB(255, 224, 224, 224);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,

        //color: Color.fromARGB(255, 0, 0, 0),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 25, top: 55),
              //color: Colors.green,
              child: Text(
                'Register',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 91, 129, 201)),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 99, 99),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "University RegNo",
                      fillColor: con_clr),
                  onChanged: (String val) {
                    reg = val;
                    print(val);
                  },
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 99, 99),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "Name",
                      fillColor: con_clr),
                  onChanged: (String val) {
                    name = val;
                  },
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 99, 99),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "Email ID",
                      fillColor: con_clr),
                  onChanged: (String val) {
                    mail = val;
                  },
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 99, 99),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "Password",
                      fillColor: con_clr),
                  onChanged: (String val) {
                    pass = val;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 25),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Color.fromARGB(31, 202, 186, 186)),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: isLoading
                              ? Color.fromARGB(255, 198, 218, 255)
                              : main_clr),
                      onPressed: () {
                        if (!isLoading) {
                          register();
                          return;
                        }
                        print('registering...');
                        setState(() {
                          isLoading = true;
                        });
                      },
                      child: Text(
                        isLoading ? 'Loading...' : 'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void register() async {
    print("is loading........");

    if (isLoading != true) {
      setState(() {
        isLoading = true;
      });
    }

    int n = await addUser(
      mailid: mail,
      name: name,
      reg_no: reg,
      passw: pass,
    );
    if (n == 0) {
      print("success");
      final sp = await SharedPreferences.getInstance();
      final isLogged = sp.setBool('IS_LOGGED', true);
      final mal = sp.setString('MAILID', mail);
      snack_success(context: context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext bc) => Homepage(
                mail_id: mail,
              )));
    } else {
      snack_failed(context: context);
      print('failed');
      setState(() {
        isLoading = false;
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
                        "Welcome to Foodiko!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                        ),
                      ),
                      Text(
                        "success!",
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
