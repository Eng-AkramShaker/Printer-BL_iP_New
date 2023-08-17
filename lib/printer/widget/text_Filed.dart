// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';

import '../../allllllll/app_colors.dart';

class Custom_Field extends StatelessWidget {
  const Custom_Field({
    required this.hint_text,
    required this.TEXT_controller,
  });
  final TEXT_controller;
  final hint_text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TEXT_controller,
      decoration: InputDecoration(
        hintText: hint_text,
        hintStyle: TextStyle(
          color: AppColors.current.dimmedLight,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: 'Tajawal',
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.current.dimmedLight.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.current.dimmedLight.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
    );
  }
}
