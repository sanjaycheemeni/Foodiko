import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodiko/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 10))
                ],
                shape: BoxShape.circle,
              ),
              child: Image.asset('img/user.png'),
            ),
            const SizedBox(
              height: 35,
            ),
            Column(
              children: [
                Text(
                  'Abhi',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text('ID: 123008')
              ],
            ),
            SizedBox(height: 50,),
           new GestureDetector(
             onTap: (){},child: Container(alignment: Alignment.center,height: 50,width: 2,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Color.fromARGB(255, 241, 241, 241)),child: Text("My Wallet",style: TextStyle(color: Color.fromARGB(255, 20, 20, 20)),),),
           ),SizedBox(height: 15,),
           new GestureDetector(
             onTap: (){


              logOut();



             },child: Container(alignment: Alignment.center,height: 50,width: 2,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Color.fromARGB(255, 247, 100, 90)),child: Text("Logout",style: TextStyle(color: Colors.white),),),
           ),
          ],
        ),
      ),
    );
  }

  Future<void> logOut() async{

    final sp = await SharedPreferences.getInstance();
    sp.setBool('IS_LOGGED', true);
    sp.clear();
    

    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (context) => LoginPage()
      ), 
     ModalRoute.withName("/Home")
    );
   /// sp.getString(key)
  }
}
