import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
 final String words;
 final Color color;
 final String ?fontFamily;
 final FontWeight fontWeight;
 final double fontSize;
  
  
  const TextWidget({
    super.key,
    required this.words,
    required this.color,
    this.fontFamily,
    required this.fontWeight,
    required this.fontSize

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      words,
      style: TextStyle(
        color: color,
        fontFamily:fontFamily ,
       fontWeight:fontWeight,
       fontSize: fontSize.sp ,
      ),
      
    );
  }
}
