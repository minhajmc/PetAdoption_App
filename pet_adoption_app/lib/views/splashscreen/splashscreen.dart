import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/services/api_services.dart';
import 'package:pet_adoption_app/viewmodels/pet_details_provider/pageview/location_provider.dart';
import 'package:pet_adoption_app/views/onboardingscreens/landingscreen.dart';
import 'package:pet_adoption_app/views/ui/root_scaffold/rootscaffold.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async {
     await initSplash();
    });
  }

Future<void> initSplash() async {
  try {
    await initBearerToken();

    if (!mounted) return;
    await Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLocation();

    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 5));
    if (!mounted) return;
    await navigateToLandingScreen();
  } catch (e) {
    log("Splashscreen error: $e");
  }
}


  Future<void> navigateToLandingScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("bearerToken");
    if (!mounted) return;
    if (token != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const RootScaffold(),
          ));
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Landingscreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      );
    }
  }

  Future<void> initBearerToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("bearerToken");

    if (token != null) {
      log("Token found:$token ::sharedprefs");

      await ApiServices.barearToken(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
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
