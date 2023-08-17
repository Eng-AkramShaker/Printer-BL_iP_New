import 'package:flutter/material.dart';

class ColorManager {
  static LinearGradient cartItemImage = LinearGradient(colors: [
    const Color(0xFFC4C4C4).withOpacity(.2),
    const Color(0xFFC4C4C4).withOpacity(.2)
  ]);

  static const Color yellowColor = Color(0xFFFFC623);
  // static const Color yellowColor = Color(0xFFFFC107);
  static const Color greyColor = Colors.grey;
  static const Color redColor = Colors.red;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  static Color green = Colors.green.shade700;
  static Color lightGreen = const Color(0xFF28C76F).withOpacity(.12);
  static Color newLightGreen = const Color.fromARGB(255, 222, 246, 235);
  static Color? lightGrey = Colors.grey[500];
  static const Color statusColorRed = Color.fromARGB(140, 250, 79, 79);
  static const Color lightYellow = Color(0xffE6D293);
  static const Color lightBarby = Color(0xffFFF9EA);

  static const Color statusTextColorGreen = Color.fromARGB(255, 211, 251, 233);

  // tog app
  static const Color textColor = Color.fromRGBO(37, 47, 61, 1);
  static const Color primary = Color(0xffFDC53A);

  static const Color success = Color(0xff840200);
  static const Color dimmedLight = Color(0xff979797);
  static const Color primaryLight = Color(0xff095f64);
  static const Color printerWidgetColor = Color(0xff5AED72);
}
