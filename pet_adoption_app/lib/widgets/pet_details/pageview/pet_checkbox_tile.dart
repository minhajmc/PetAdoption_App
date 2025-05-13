import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class PetCheckboxTile extends StatelessWidget {
  final String statusText;
  final void Function(bool?) onChange;
  const PetCheckboxTile(
      {super.key, required this.statusText, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: TextWidget(
            words: statusText,
            color: const Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 18.spMin),
        trailing: Transform.scale(
          scale: 1.3.w,
          child: GFToggle(
            onChanged: onChange,
            value: false,
            enabledText: "Yes",
            disabledText: "No",
            type: GFToggleType.square,
            disabledTextStyle: TextStyle(fontSize: 10.spMin,color: Colors.white),
            enabledTextStyle: TextStyle(fontSize: 10.spMin,color: Colors.white),
            disabledThumbColor: const Color.fromARGB(244, 236, 239, 241),
            disabledTrackColor: const Color.fromARGB(255, 189, 206, 214),
            enabledThumbColor: const Color(0xFFD1C4E9),
            enabledTrackColor: const Color.fromARGB(210, 134, 121, 226),
          ),
        ));
  }
}
