import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/views/onboardingscreens/WelcomeAuthScreen.dart';
import 'package:pet_adoption_app/widgets/authwidgets/elevatedButtonWidget.dart';
import 'package:pet_adoption_app/widgets/authwidgets/pawImagewithText.dart';

class Landingscreen extends StatefulWidget {
  const Landingscreen({super.key});

  @override
  State<Landingscreen> createState() => _LandingscreenState();
}

class _LandingscreenState extends State<Landingscreen> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),
      body: SafeArea(
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints){
                return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                children: [
                  const PawImagewithText(),
                
                  SizedBox(height: constraints.maxHeight<=620?0.02:0.04.sh,),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: constraints.maxWidth<=360?0.4.sh:0.5.sh,
                          width: 1.sw,
                          child: Image.asset("assets/onboarding/familywithpet.png")),
                        SizedBox(height: 30.h,),
                        SizedBox(
                          child: DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: constraints.maxHeight<=620?25.sp:32.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              child: isAnimated
                                  ? const Text(
                                      "Get started by finding the perfect companion for \nyour family!",
                                      textAlign: TextAlign.center,
                                    )
                                  : AnimatedTextKit(
                                      onFinished: () {
                                        setState(() {
                                          isAnimated = true;
                                        });
                                      },
                                      repeatForever: false,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                          TyperAnimatedText(
                                              "Get started by finding the perfect companion for your family!",
                                              textAlign: TextAlign.center,
                                              speed: Duration(milliseconds: 50)),
                                        ])),
                                        
                        ),
                        SizedBox(height: 40.h,),
                        ElevatedButtonWidget(text: "Welcome", height: 46.h, width: 1.sw, elevation: 9, backgroundColor:0xFFFF8E3C , fontSize: 20.sp, textColor: Colors.black, borderRadius: 15, tap: () {
                          log(MediaQuery.of(context).size.width.toString());
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Welcomeauthscreen(),));
                          
                        }, borderColor: 0xFFFF8E3C)
                      ],
                    ),
                  ),
                ],
                        ),
                      );
              }
            ),
          )),
    );
  }
}
