import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addOrder(username, usernumber, useraddress, qty, unit, userprofile,
    orderType, String mode) async {
  final docUser = FirebaseFirestore.instance.collection('Orders').doc();

  final json = {
    'username': username,
    'usernumber': usernumber,
    'useraddress': useraddress,
    'id': docUser.id,
    'qty': qty,
    'unit': unit,
    'dateTime': DateTime.now(),
    'status': 'Pending',
    'userId': FirebaseAuth.instance.currentUser!.uid,
    'userprofile': userprofile,
    'orderType': orderType,
    'mode': mode,
  };

  await docUser.set(json);
}
