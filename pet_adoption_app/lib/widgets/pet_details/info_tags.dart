import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class InfoTags extends StatelessWidget {
  final String label;
  final String value;
  final int backgroundColor;

  const InfoTags(
      {super.key,
      required this.label,
      required this.value,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 7,
      child: IntrinsicWidth(
        child: Container(
          height: 80.h,
          width: 107.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8.r,
              ),
              color:Color(backgroundColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget(
                  words: label,
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.spMin),
              TextWidget(
                  words: value,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.spMin),
            ],
          ),
        ),
      ),
    );
  }
}
