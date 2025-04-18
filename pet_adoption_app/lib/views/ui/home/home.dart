import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

import 'package:pet_adoption_app/views/ui/home/carouselsection.dart';
import 'package:pet_adoption_app/views/ui/home/category.dart';
import 'package:pet_adoption_app/views/ui/home/headersection.dart';
import 'package:pet_adoption_app/views/ui/home/searchwithicon.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  final List<String> image = [
    "assets/mainuislideimg/carouselimg/puppy_img6.jpg",
    "assets/mainuislideimg/carouselimg/puppy_img6.jpg",
    "assets/mainuislideimg/carouselimg/puppy_img6.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
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
                padding: EdgeInsets.only(top: 20.h, left: 35.w, right: 35.w),
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
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFItemsCarousel(
                    itemHeight: 250,
                    rowCount: 1,
                    children: image.map(
                      (e) {
                        return GFShimmer(
                            child: Container(
                          color: Colors.lime,
                        ));
                      },
                    ).toList()),
              ),
            ],
          ),
        );
      }
    );
  }
}
