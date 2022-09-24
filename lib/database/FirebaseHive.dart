import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<List<DocumentSnapshot>> fetchLeaderBoard() async {
  final result = await _firestore.collection('User').limit(10).get();

  //print(result);

  return result.docs;
}

getData1() async {
  final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('User').get();

  print(snapshot.docs);

  return null;
}

List? contacts;
Future<void> getData() async {
  var collection = await FirebaseFirestore.instance.collection('User');
  var docSnapshot = await collection.doc('a@b.com').get();
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data();
    var value = data?['name'];
    print(value);
  }
}

getName(String mail) async {
  final sp = await SharedPreferences.getInstance();
  // final isLogged = sp.setBool('IS_LOGGED', true);
  // final mail = sp.setString('MAILID',emailid);
  final mid = await sp.getString('MAILID');
  print("mail->" + mid!);

  var collection = await FirebaseFirestore.instance.collection('User');
  var docSnapshot = await collection.doc(mid).get();
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data();
    var value = data?['name'];
    return value;
  } else {
    return "";
  }
}

getNotify() async {
  var collection = await FirebaseFirestore.instance.collection('NoticeBoard');
  var docSnapshot = await collection.doc('NOTIFICATION').get();
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data();
    var value = data?['content'];
    print(value);
    return value;
  } else {
    print('none');
    return "";
  }
}

getWallet() async {
  final sp = await SharedPreferences.getInstance();
  // final isLogged = sp.setBool('IS_LOGGED', true);
  // final mail = sp.setString('MAILID',emailid);
  final mid = await sp.getString('MAILID');
  print("walet of->" + mid!);

  var collection = await FirebaseFirestore.instance.collection('User');
  var docSnapshot = await collection.doc(mid).get();
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data();
    var value = data?['balance'];
    return value;
  } else {
    return "";
  }
}
