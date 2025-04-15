import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/views/onboardingscreens/landingscreen.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
               const Landingscreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 1000)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration:const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
      Color(0xFFFDEBD0), // creamy peach
      Color(0xFFFADBD8), // pastel coral
      Color(0xFFD6EAF8), // soft baby blue
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              //Animation
              SizedBox(
                  child: Lottie.asset(
                      "assets/splashscreen/walking_with_dog.json",
                      width: 1.sw,
                      height: 0.5.sh,
                      fit: BoxFit.fill)),
              SizedBox(height: 20.h),
              //App Name
              TextWidget(
                words: "Happy Tails",
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 8.h),
              //Extra Texts
              TextWidget(
                words: "Find Your furry friend 🐶",
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
