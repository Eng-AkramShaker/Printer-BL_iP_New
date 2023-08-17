// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Snak_Bar(BuildContext context, SnackMessage, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 50,
        child: Center(
            child: Text(
          SnackMessage,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        )),
      ),
      duration: const Duration(milliseconds: 2000),
      width: 290.0, // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: color,
    ),
  );
}
