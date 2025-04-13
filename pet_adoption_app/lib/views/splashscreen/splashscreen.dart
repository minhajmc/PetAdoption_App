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

  // @override
  // void initState() {
    
  //   super.initState();
  //   Future.delayed(Duration(seconds: 5),(){
  //     Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => Landingscreen(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return FadeTransition(opacity: animation,child: child,);
      
  //     },transitionDuration: Duration(milliseconds: 800)),
  //     );

  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFF5F0E6) ,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h,),
            Lottie.asset("assets/onboarding/Animation - 1743595280705.json",),
            SizedBox(height: 20.h),
            TextWidget( // using your custom text widget
              words: "HappyTail",
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4A4A4A),
            ),
            SizedBox(height: 8.h),
            TextWidget(
              words: "Find Your furry friend 🐶🐱",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}