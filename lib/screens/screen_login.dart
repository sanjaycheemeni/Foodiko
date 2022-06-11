import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFEBEBEB)
              ),
            ),
          ),
          Padding(
            
            padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
            child: TextField(
              
              decoration: InputDecoration(
                
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFEBEBEB)
              ),
            ),
          )
          ]),
        ),
      ),
    );
  }
}
/*

Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFEBEBEB)
              ),
            ),
          )

*/