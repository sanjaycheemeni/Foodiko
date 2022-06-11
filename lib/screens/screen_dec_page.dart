import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Decpage extends StatefulWidget {
  const Decpage({Key? key}) : super(key: key);

  @override
  State<Decpage> createState() => _DecpageState();
}

class _DecpageState extends State<Decpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 110, 00, 00),
                    child: Text(
                      'Hey',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1f1f1f)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 160, 00, 00),
                    child: Text(
                      'Foodie',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1f1f1f)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(175, 164, 00, 00),
                    child: Text(
                      '!',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2865d4)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Mobile no',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    obscureText: true,
                      decoration: InputDecoration(
                        
                          hintText: 'password',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none))),
                ),
                
              ),
            
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180,top: 20),
              child: OutlinedButton(
        style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              backgroundColor: Color(0xFF2865d4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        child:  Text(
          'Login',
          style: TextStyle(fontSize: 24,color:Colors.white),
        ),
        onPressed: () {},
),
            )
            
          ],
        ));
  }
}
