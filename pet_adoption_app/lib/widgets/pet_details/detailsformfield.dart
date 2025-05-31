import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsFormField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  FocusNode? focusNode;
  FocusNode? whereToFocus;
  final int maxLine;
  DetailsFormField(
      {super.key,
      required this.hintText,
      required this.inputType,
      required this.controller,
      required this.maxLine,
      this.whereToFocus,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      style: TextStyle(fontSize: 15.spMin),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: hintText,
      ),
      keyboardType: inputType,
      controller: controller,
      inputFormatters: [
        if(inputType==TextInputType.number)
          FilteringTextInputFormatter.digitsOnly
        
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Must $hintText";
        } else if (hintText == "Enter Your Email") {
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return "Please enter a valid email";
          }
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
