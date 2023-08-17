// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class All_Var with ChangeNotifier {
  //
  bool ethernet = false;
  bool bluetooth = false;
  bool usb = false;

// ==========================================================
  final ipController = TextEditingController();

  String img = 'assets/images/logo2.jpeg';
  String Qr_img = 'assets/images/qr.jpg';
  String ar_Test = "إختبار الطابعة";
  String en_Test = "Printer Test";

// ==========================================================

  bool_ethernet() {
    ethernet = true;
    notifyListeners();
  }

  bool_bluetooth() {
    bluetooth = true;
    notifyListeners();
  }

  bool_usb() {
    usb = true;
    notifyListeners();
  }
// =======================================================

  print() {
    notifyListeners();
  }
}
