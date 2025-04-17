import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/views/home/homescreens/carouselsection.dart';
import 'package:pet_adoption_app/views/home/homescreens/category.dart';
import 'package:pet_adoption_app/views/home/homescreens/headersection.dart';
import 'package:pet_adoption_app/views/home/homescreens/searchwithicon.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> img = [
    "assets/mainuislideimg/carouselimg/kitty_img5.jpg",
    "assets/mainuislideimg/carouselimg/dog_img2 (2).jpg",
    "assets/mainuislideimg/carouselimg/puppy_img6.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F0E6),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Column(
                children: [
                  //listtile

                  Headersection(
                      gfSize: constraints.maxWidth <= 360
                          ? GFSize.MEDIUM
                          : GFSize.LARGE),

                  //searchbar
                  SearchwithIcon(constraints: constraints.maxWidth),

                  SizedBox(
                    height: 30.h,
                  ),
                  //CarouselSection
                  CarouselSection(
                      containerTextSizeHeight:
                          constraints.maxWidth <= 526 ? 90.h : 140),

                  //pet Categories

                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.h, left: 32.w, right: 30.w, bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            words: "Pet Categorties",
                            color: Color(0xFF5F5B5B),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.spMin),
                        TextWidget(
                            words: "More Category",
                            color: Color(0xFF827397),
                            fontWeight: FontWeight.normal,
                            fontSize: 13.spMin),
                      ],
                    ),
                  ),
                  //categariesofpets
                  CategoryofPet(),

                  //Adopt Option
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 35.w, right: 35.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            words: "Adopt pet",
                            color: Color(0xFF5F5B5B),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.spMin),
                        TextWidget(
                            words: "See all",
                            color: Color(0xFF5F5B5B),
                            fontWeight: FontWeight.normal,
                            fontSize: 13.spMin),
                      ],
                    ),
                  ),
                  //petImage
                  GFItemsCarousel(
                    rowCount: 2,
                    children: img.map(
                      (imgPath) {
                        return GFShimmer(
                          showShimmerEffect:
                              true, // make sure shimmer is visible
                          mainColor: Colors.grey.shade300,
                          secondaryColor: Colors.grey.shade100,
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                imgPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
