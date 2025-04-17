import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class CategoryofPet extends StatefulWidget {
  CategoryofPet({super.key});

  @override
  State<CategoryofPet> createState() => _CategoryofPetState();
}

class _CategoryofPetState extends State<CategoryofPet> {
 final List<Map<String, dynamic>> categoryofPets = [
    {"image":"assets/mainuislideimg/categoriesimg/pets.png","petType":"All","color":Colors.deepPurple},
    {"image":"assets/mainuislideimg/categoriesimg/cat64.png","petType":"Cat","color":	Color(0xFF9C27B0)},
    {"image":"assets/mainuislideimg/categoriesimg/dog (2).png","petType":"Dog","color":Color(0xFF42A5F5)},
    {"image":"assets/mainuislideimg/categoriesimg/rabbit.png","petType":"Rabbit","color":	Color(0xFFF48FB1)},
    {"image":"assets/mainuislideimg/categoriesimg/hamster.png","petType":"Hams","color":Color(0xFFFFB74D)},
    {"image":"assets/mainuislideimg/categoriesimg/turtle.png","petType":"Turtle","color":Color(0xFF4DB6AC)},

  ];
  
  int onIndex=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: SizedBox(
        height: 50.h,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // padding: EdgeInsets.symmetric(vertical: 20.w),
          itemCount: categoryofPets.length,
          itemBuilder: (context, index) {
            final currentIndex=index==onIndex;
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    onIndex=index;
                  });
                  log(categoryofPets[index]['petType']);
                  
                },
                child: Container(
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: currentIndex?Color(0xFF827397): Color.fromARGB(171, 220, 219, 219),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      // Image.asset("assets/mainuislideimg/categoriesimg/cat.png"),
                      //  Image.asset("assets/mainuislideimg/categoriesimg/catnew.png"),
                      GFAvatar(
                        backgroundImage: AssetImage(
                            categoryofPets[index]["image"]),
                        size: 20,
                        backgroundColor:
                        categoryofPets[index]["color"],
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      TextWidget(
                          words: categoryofPets[index]["petType"],
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.spMin)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
