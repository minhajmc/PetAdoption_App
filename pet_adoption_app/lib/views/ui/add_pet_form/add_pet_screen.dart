import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/add_pet_footersection.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/pageview/add_pet_page1.dart';
import 'package:pet_adoption_app/widgets/authwidgets/elevatedButtonWidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  PetProfile? petProfile = PetProfile();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F0E6), // original app color
        body: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30.w,
                    color: Color(0xFFB39DDB), // soft lavender
                  ),
                ),
                TextWidget(
                  words: "Add Pet",
                  color: Color(0xFF212121), // dark text
                  fontWeight: FontWeight.bold,
                  fontSize: 25.spMin,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close_rounded,
                    size: 30.w,
                    color: Color(0xFFB39DDB), // soft lavender
                  ),
                ),
              ],
            ),
            indicator(),

            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  AddPetPage1(
                    onTap: (petprofiledetails) {
                      petProfile = petprofiledetails;

                      log(petProfile!.petName.toString());
                    },
                    petProfile: petProfile,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20.h,
            )
            // AddPetFooterSection(pageController: _pageController),
          ],
        ),
      ),
    );
  }

  // Widget _buildPage(String text) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(30),
  //         topRight: Radius.circular(30),
  //       ),
  //       color: Color(0xFFF9F7F1), // very light version of scaffold color
  //     ),
  //     child: Center(
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //           fontSize: 32.spMin,
  //           color: Color(0xFF212121), // dark readable text
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget indicator() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, bottom: 30.h),
        child: SmoothPageIndicator(
          controller: _pageController,
          count: 5,
          effect: ExpandingDotsEffect(
            activeDotColor: Color(0xFFB388FF), // soft purple
            dotHeight: 13.h,
            dotWidth: 16.w,
            spacing: 20.w,
            dotColor: Color(0xFFDADADA), // neutral dot
          ),
        ),
      ),
    );
  }
}
