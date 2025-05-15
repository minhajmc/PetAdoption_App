import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/services/api_services.dart';
import 'package:pet_adoption_app/viewmodels/auth_provider/login_provider.dart';
import 'package:pet_adoption_app/viewmodels/auth_provider/register_provider.dart';
import 'package:pet_adoption_app/viewmodels/profile_provider/profileget_provider.dart';
import 'package:pet_adoption_app/viewmodels/profile_provider/profileupdate_provider.dart';
import 'package:pet_adoption_app/views/splashscreen/splashscreen.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/add_pet_ui/add_pet_screen.dart';
import 'package:pet_adoption_app/views/ui/pet_details/pet_details_screen.dart';

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
          ChangeNotifierProvider(create: (context) => RegisterProvider(),),
          ChangeNotifierProvider(create: (context) => ProfileUpdateProvider(),),
          ChangeNotifierProvider(create: (context) => ProfileGetProvider(),),
        ],
        child: MaterialApp(
        title: "Pet Adoption App",
        debugShowCheckedModeBanner: false,
        home:AddPetScreen(),
      ),);
      },
    );
  }
}



