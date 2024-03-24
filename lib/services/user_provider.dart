import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  late String farmName;
  late String address;
  late String contactNumber;

  void setUserData(String farmName, String address, String contactNumber) {
    this.farmName = farmName;
    this.address = address;
    this.contactNumber = contactNumber;
    notifyListeners();
  }
}
