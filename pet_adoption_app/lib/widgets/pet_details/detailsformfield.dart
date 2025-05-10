import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsFormField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  FocusNode focusNode;
  FocusNode ?whereToFocus;
  DetailsFormField(
      {super.key,
      required this.hintText,
      required this.inputType,
      required this.controller,
      required this.whereToFocus,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 15.spMin),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: hintText,
      ),
      keyboardType: inputType,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Must Enter $hintText";
        } else {
          return null;
        }
      },
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(whereToFocus);
      },
    );
  }
}
