import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    color: Color.fromARGB(255, 255, 174, 0)),
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "University RegNo",
                      fillColor: Color.fromARGB(255, 39, 39, 39)),
                  onChanged: (String val) {
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "Email id",
                      fillColor: Color.fromARGB(255, 39, 39, 39)),
                  onChanged: (String val) {
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintText: "Name",
                      fillColor: Color.fromARGB(255, 39, 39, 39)),
                  onChanged: (String val) {
                    print(val);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
