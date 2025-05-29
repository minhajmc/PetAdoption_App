import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class MedicalConditionSelector extends StatefulWidget {
  final String text;
  final void Function(bool?) onchanged;
  
  // final VoidCallbackAction ontap;
  const MedicalConditionSelector({super.key, required this.text,required this.onchanged});

  @override
  State<MedicalConditionSelector> createState() => _MedicalConditionSelectorState();
}

class _MedicalConditionSelectorState extends State<MedicalConditionSelector> {
  bool? trueorFalse=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2.w,
          child: Checkbox(
            value: trueorFalse,
            onChanged: (value) {
              setState(() {
                trueorFalse=value;
                widget.onchanged(value);
              });
            },
            side: BorderSide(
              width: 1.w
              ,
            ),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(7.r)),
          ),
        ),
        TextWidget(
            words: widget.text,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.spMin),
      ],
    );
  }
}
