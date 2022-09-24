// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) {}

Future<int> addUser(
    {required String reg_no,
    required String name,
    required String mailid,
    required String passw}) async {
  try {
    await Firebase.initializeApp();
    CollectionReference users = FirebaseFirestore.instance.collection('User');

    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: mailid,
      password: passw,
    );
    print('reg started');

    users.doc(mailid).set({
      "reg_no": reg_no,
      "name": name,
      "mailid": mailid,
      "status": "offline",
      "balance": "0"
    });
    // users.add({
    //   "reg_no": reg_no,
    //   "name": name,
    //   "mailid": mailid,
    //   "status": "offline"
    // });
    print('done');
    return 0;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return 1;
}

getUser(String mail) async {
  await Firebase.initializeApp();
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final val = users.doc().get();
  print(val.toString());
}
