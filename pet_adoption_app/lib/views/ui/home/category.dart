import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

class CategoryofPet extends StatefulWidget {
  const CategoryofPet({super.key});

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
      padding:  EdgeInsets.only(right: 6.w, left: 12.w),
      child: SizedBox(
  height: 50.h,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categoryofPets.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ChoiceChip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GFAvatar(
                backgroundImage: AssetImage(categoryofPets[index]["image"]),
                size: 15.w,
                backgroundColor: categoryofPets[index]["color"],
              ),
              SizedBox(width: 5.w),
              Text(
                categoryofPets[index]["petType"],
                style: TextStyle(
                  color: onIndex == index ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          selected: onIndex == index,
          onSelected: (selected) {
            setState(() {
              onIndex = index;
            });
            log(categoryofPets[index]['petType']);
          },
          selectedColor: Color(0xFF827397),
          backgroundColor: Color.fromARGB(171, 220, 219, 219),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 4,
          
        ),
      );
    },
  ),
)

    );
  }
}
