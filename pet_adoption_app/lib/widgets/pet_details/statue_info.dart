import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class StatueInfo extends StatelessWidget {
  final String label;
  final bool iswhatTrFa;
  const StatueInfo({super.key, required this.label, this.iswhatTrFa = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Chip(
        label: TextWidget(
            words: label,
            color: iswhatTrFa ? Colors.green.shade700 : Colors.red.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 15.spMin,
            ),
        avatar: Lottie.asset(
          iswhatTrFa
              ? "assets/mainuislideimg/petdetails/Animation - 1745562330185.json"
              : "assets/mainuislideimg/petdetails/Animation - 1745562975664.json",
        ),
        backgroundColor: iswhatTrFa ? Colors.green.shade100 : Colors.red.shade100,
      ),
    );
  }
}
