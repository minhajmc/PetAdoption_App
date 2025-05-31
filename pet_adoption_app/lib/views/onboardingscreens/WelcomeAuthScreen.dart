
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/viewmodels/pet_details_provider/pageview/location_provider.dart';
import 'package:pet_adoption_app/views/auth/loginscreen/login.dart';
import 'package:pet_adoption_app/views/auth/signupscreen/signup.dart';
import 'package:pet_adoption_app/widgets/authwidgets/elevatedButtonWidget.dart';
import 'package:pet_adoption_app/widgets/authwidgets/pawImagewithText.dart';
import 'package:provider/provider.dart';

class Welcomeauthscreen extends StatefulWidget {
  const Welcomeauthscreen({super.key});

  @override
  State<Welcomeauthscreen> createState() => _WelcomeAuthScreen();
}

class _WelcomeAuthScreen extends State<Welcomeauthscreen> {
    bool isAnimated=false;
    
  @override
  Widget build(BuildContext context) {
    final locationProvider=Provider.of<LocationProvider>(context,listen: false);

 
    return Scaffold(
      backgroundColor:const Color(0xFFF5F0E6),
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints){
        return SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 0.02.sh),
           const PawImagewithText(),
            SizedBox(
              height: 0.1.sh,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.02.sh, left: 30.w, right: 30.w),
              child: Column(
                children: [
                  Center(
                      child: SizedBox(
                          height:
                              constraints.maxHeight <= 620 ? 0.3.sh : 0.4.sh,
                          width: 1.sw,
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.18.sw),
                            child: Image.asset(
                              "assets/onboarding/dogsitting.png",
                              // cacheWidth: 600,
                              // cacheHeight: 400,
                            ),
                          ))),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  SizedBox(
                    child: DefaultTextStyle(textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 32.spMin,),
                        child:isAnimated?const Text("Discover a world of joy and companionship at Happy pet"): AnimatedTextKit(
                            repeatForever: false,onFinished: () {
                              setState(() {
                                isAnimated=true;
                              });
                            },
                            totalRepeatCount: 1,
                            animatedTexts: [
                              TyperAnimatedText(
                                  "Discover a world of joy and companionship at Happy pet",
                                  speed: Duration(milliseconds: 100)),
                            ])),
                  ),
                  SizedBox(height: 0.02.sh),
                  ElevatedButtonWidget(
                    text: "LOGIN",
                    height: 45.h,
                    width: 1.sw,
                    elevation: 5,
                    backgroundColor: 0xFFFF8E3C,
                    fontSize: 18.spMin,
                    textColor: Colors.black,
                    borderRadius: 20.r,
                    tap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const LoginScreen(),
                          ));
                    },
                    borderColor: 0xFFFF8E3C,
                  ),
                  SizedBox(height: 0.03.sh),
                  ElevatedButtonWidget(
                    text: "SIGN UP",
                    height: 45.h,
                    width: 1.sw,
                    elevation: 8,
                    backgroundColor: 0xFFFFFFFF,
                    fontSize: 18.spMin,
                    textColor: Colors.black,
                    borderRadius: 20.r,
                    tap: () async{
                      await locationProvider.getCurrentLocation();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const Regscreen(),
                          ));
                    },
                    borderColor: 0xFFFF8E3C,
                  ),
                ],
              ),
            ),
          ]),
        );
      })),
    );
  }
}
