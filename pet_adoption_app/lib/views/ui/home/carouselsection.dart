import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class CarouselSection extends StatelessWidget {
  final double containerTextSizeHeight;
  const CarouselSection({super.key, required this.containerTextSizeHeight});

  static const List<Map<String, dynamic>> carouselData = [
    {
      "image": "assets/mainuislideimg/carouselimg/cat_img1.jpg",
      "title": "Meet Your New Best Friend!",
      "subtitle":
          "🖤 Every pet deserves love. Find your\n perfect companion today!"
    },
    {
      "image": "assets/mainuislideimg/carouselimg/dog_img2 (2).jpg",
      "title": "Rescue, Love, Repeat",
      "subtitle": "🐾 Adopt happiness, one paw at a time!"
    },
    {
      "image": "assets/mainuislideimg/carouselimg/bird_img3.jpg",
      "title": "Chirp Your Way to Joy!",
      "subtitle":
          "🐦 Let the melodies of a feathered \n friend brighten your days."
    },
    {
      "image": "assets/mainuislideimg/carouselimg/cat_dog_img4.jpg",
      "title": "Furry Friends Await!",
      "subtitle": "🏡 Give a loving home to a loyal buddy."
    },
    {
      "image": "assets/mainuislideimg/carouselimg/kitty_img5.jpg",
      "title": "Paws and Smiles",
      "subtitle": "😊 A tail wag is just one adoption away!"
    },
    {
      "image": "assets/mainuislideimg/carouselimg/puppy_img6.jpg",
      "title": "Unconditional Love",
      "subtitle": "🐕 Bring joy into your life — adopt today!"
    },
    {
      "image": "assets/mainuislideimg/carouselimg/cat_img7.jpg",
      "title": "Forever Friends",
      "subtitle": "🧡 Be a hero — adopt a pet in need."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      items: carouselData.map(
        (data) {
          return SizedBox(
              child: Padding(
            padding: EdgeInsets.all(6.r),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              shadowColor: Colors.black,
              elevation: 6,
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    data["image"],
                    fit: BoxFit.cover,
                    width: 1.sw,
                    cacheWidth: 300,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration:const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black87,
                          ],
                        ),
                      ),
                      width: 1.sw,
                      height: containerTextSizeHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              words: data["title"],
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.spMin),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextWidget(
                            words: data["subtitle"],
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.spMin,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
        },
      ).toList(),
      autoPlay: true,
      autoPlayAnimationDuration:const Duration(milliseconds: 1000),
    );
  }
}
