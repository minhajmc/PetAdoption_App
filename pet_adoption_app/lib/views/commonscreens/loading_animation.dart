import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  final String text;
  final String path;
  const LoadingAnimation({super.key, required this.text, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF1E6), Color(0xFFFDFCFB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0.3.sh),
              child: DefaultTextStyle(
                  style: TextStyle(
                      color: Color(0xFF444654),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                  child: AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText(text,
                        speed: Duration(
                          milliseconds: 100,
                        )),
                        TyperAnimatedText("Please Wait...", speed: Duration(
                          milliseconds: 100,
                        ))
                  ])),
            ),
            Center(child: Hero(tag: "loadingAnimation",child: Lottie.asset(path,repeat: true))),
          ],
        ),
      ),
    );
  }
}
