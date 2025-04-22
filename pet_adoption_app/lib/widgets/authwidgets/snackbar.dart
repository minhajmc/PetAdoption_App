import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbar(
  BuildContext context,
  String? text,
  int color,
  IconData icon,
) {
 return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10.w),
          Text("$text"),
        ],
      ),
      backgroundColor: Color(color), // Beautiful green
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      duration: Duration(seconds: 4),
    ),
  );
}
