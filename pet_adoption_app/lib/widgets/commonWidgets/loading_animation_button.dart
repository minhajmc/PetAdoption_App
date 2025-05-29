import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimationButton extends StatelessWidget {
  const LoadingAnimationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                          height: 60.h,
                          width: double.infinity,
                          child: Card(
                            color: Color(0xFFB39DDB),
                            elevation: 5,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Lottie.asset(
                                "assets/reausable_json/Animation - 1748240568008.json"),
                          ),
                        );
  }
}