import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/viewmodels/pet_details_provider/pet_get_provider/pet_details_get_provider.dart';
import 'package:provider/provider.dart';

class CategoryofPet extends StatefulWidget {
  const CategoryofPet({super.key});

  @override
  State<CategoryofPet> createState() => _CategoryofPetState();
}

class _CategoryofPetState extends State<CategoryofPet> {
 static const List<Map<String, dynamic>> categoryofPets =[
    {"image":"assets/mainuislideimg/categoriesimg/pets.png","petType":"All","color":Colors.deepPurple},
    {"image":"assets/mainuislideimg/categoriesimg/cat64.png","petType":"Cat","color":	Color(0xFF9C27B0)},
    {"image":"assets/mainuislideimg/categoriesimg/dog (2).png","petType":"Dog","color": Color(0xFF42A5F5)},
    {"image":"assets/mainuislideimg/categoriesimg/rabbit.png","petType":"Rabbit","color": Color.fromARGB(255, 241, 59, 229)},
    {"image":"assets/mainuislideimg/categoriesimg/hamster.png","petType":"Hams","color": Color(0xFFFFB74D)},
    {"image":"assets/mainuislideimg/categoriesimg/turtle.png","petType":"Turtle","color": Color(0xFF4DB6AC)},

  ];
  
  int onIndex=0;
  @override
  Widget build(BuildContext context) {

   final getProvider= Provider.of<PetDetailsGetProvider>(context,listen: false);
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
          onSelected: (selected) async{
            setState(() {
              onIndex = index;
            });
            if(index==0){
             await getProvider.petGetDetailsApi(null);
            }else{
              await getProvider.petGetDetailsApi(categoryofPets[index]["petType"]);
            }
            log(categoryofPets[index]['petType']);
            log(index.toString());
          },
          selectedColor:const Color(0xFF827397),
          backgroundColor:const Color.fromARGB(171, 220, 219, 219),
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
