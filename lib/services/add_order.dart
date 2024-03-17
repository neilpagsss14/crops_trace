import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addOrder(cropName, farmName, number, address, qty, unit) async {
  final docUser = FirebaseFirestore.instance.collection('Orders').doc();

  final json = {
    'cropName': cropName,
    'farmName': farmName,
    'usernumber': number,
    'useraddress': address,
    'qty': qty,
    'unit': unit,
    'dateTime': DateTime.now(),
    'userId': FirebaseAuth.instance.currentUser!.uid,
  };

  await docUser.set(json);
}
