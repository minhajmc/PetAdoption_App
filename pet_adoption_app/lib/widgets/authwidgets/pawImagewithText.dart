import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PawImagewithText extends StatelessWidget {
  const PawImagewithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
        ),
        SizedBox(
          width: 35.w,
          height: 35.h,
          child: SvgPicture.asset(
            "assets/loginImage/pet-svgrepo-paw.svg",
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        // SizedBox(
        //   height: 10.h,
        // ),
        Padding(
          padding: EdgeInsets.only(
            top: 10.h,
          ),
          // child: TextWidget(
          //     words: "HappyTails",
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 15.spMin),

          child: DefaultTextStyle(style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.spMin
            
          ), child: AnimatedTextKit(repeatForever: true,
            animatedTexts: [
            WavyAnimatedText("HappyTails",),
          ])),
        )
      ],
    );
  }
}
