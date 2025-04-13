import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/services/api_services.dart';
import 'package:pet_adoption_app/viewmodels/auth_provider/login_provider.dart';
import 'package:pet_adoption_app/viewmodels/auth_provider/register_provider.dart';
import 'package:pet_adoption_app/views/onboardingscreens/WelcomeAuthScreen.dart';

import 'package:pet_adoption_app/views/onboardingscreens/landingscreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiServices.initialize();

  runApp(const PetAdoptionApp());
}

class PetAdoptionApp extends StatelessWidget {
  const PetAdoptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(411, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => LoginProvider(),),
          ChangeNotifierProvider(create: (context) => RegisterProvider(),)
        ],
        child: MaterialApp(
        title: "Pet Adoption App",
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child:Landingscreen(),
       
          ),
      ),);
      },
    );
  }
}

