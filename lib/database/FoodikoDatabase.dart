// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodiko/database/FirebaseHive.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {}

Future<void> updateStatus(String mailid) async {
  await Firebase.initializeApp();
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  users.doc(mailid).update({
    "status": "online",
  });
}

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

createOrder(
    {required mailid, required fname, required foodid, required price}) async {
  try {
    await Firebase.initializeApp();
    CollectionReference users = FirebaseFirestore.instance.collection('Order');

    DateTime now = DateTime.now();
    String fd = DateFormat('yyyyMMddkkmm').format(now);

    users.doc(fd + mailid).set({
      "foodid": foodid,
      "mailid": mailid,
      "price": price,
      "name": fname,
      "status": "PENDING",
      "tokenid": fd + mailid
    });

    users = FirebaseFirestore.instance.collection('User');
    users.doc(mailid).update({
      "balance": (double.parse(
                  await getValue(colid: 'User', docid: mailid, colname: '')) -
              double.parse(price))
          .toString()
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
