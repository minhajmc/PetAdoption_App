import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/viewmodels/pet_details_provider/pet_get_provider/pet_details_get_provider.dart';
import 'package:pet_adoption_app/viewmodels/profile_provider/profileget_provider.dart';

import 'package:pet_adoption_app/views/ui/home/carouselsection.dart';
import 'package:pet_adoption_app/views/ui/home/category.dart';
import 'package:pet_adoption_app/views/ui/home/headersection.dart';
import 'package:pet_adoption_app/views/ui/home/searchwithicon.dart';
import 'package:pet_adoption_app/views/ui/pet_details/pet_details_screen.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> image = [
    "assets/mainuislideimg/carouselimg/puppy_img6.jpg",
    "assets/mainuislideimg/carouselimg/puppy_img6.jpg",
    "assets/mainuislideimg/carouselimg/puppy_img6.jpg"
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Avoid triggering rebuild while widget is still building
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileGetProvider>(context, listen: false).getProfile();
      Provider.of<PetDetailsGetProvider>(context,listen: false).petGetDetailsApi(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: 1.sw,
        child: Column(children: [
          //listtile

          Headersection(
              gfSize:
                  constraints.maxWidth <= 360 ? GFSize.MEDIUM : GFSize.LARGE),

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

          Consumer<PetDetailsGetProvider>(
            builder:(context, petdetails, child){
              return petdetails.isLoading==true?SizedBox():
               SizedBox(
                height: 300.h,
                child:
                 ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PetDetailsScreen(),)),
                          child: Container(
                            width: 250.w,
                            height: 280.h,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 210.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.w),
                                      topRight: Radius.circular(20.w),
                                    ),
                                    child: Stack(
                                      children: [
                                        // Image.network(petdetails.petProfileModelData[index]!.imageUrls!.first.toString()),
                                       CachedNetworkImage(
                                         imageUrl:  petdetails.petProfileModelData[index]!.imageUrls![0],
                                          fit: BoxFit.cover,
                                          height: 220.h,
                                          width: 250.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(15.r),
                                          child: Align(
                                              alignment: Alignment.topRight,
                                              child: GFIconButton(
                                                icon: Icon(
                                                  Icons.favorite,
                                                ),
                                                onPressed: () {},
                                                color: Colors.white60,
                                                type: GFButtonType.outline2x,
                                                shape: GFIconButtonShape.square,
                                                size: 30,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                
                                Padding(
                                  padding: EdgeInsets.all(13.r),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      children: [
                                      
                                        
                                        Column(
                                          children: [
                                            TextWidget(
                                                words:petdetails.petProfileModelData[index]!.petName!,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.spMin),
                                            TextWidget(
                                                words: "    Age : ${petdetails.petProfileModelData[index]!.age!}",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.spMin),
                                          ],
                                        ),


                                        
                                        
                                      petdetails.petProfileModelData[index]!.gender=="Male"?  Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0x308EB1E5)),
                                          child: Center(child: Icon(Icons.male_rounded,size: 30.w,color: Color(0xFF8EB1E5),)),
                                        ):
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0x30F672E1)),
                                          child: Center(child: Icon(Icons.female_rounded,size: 30.w,color: Color(0xFFF672E1),)),
                                        ),
                                        
                                    
                                      ],
                                    ),
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  },
                  itemCount: petdetails.petProfileModelData.length,
                ),
              );
            }
          ),

          SizedBox(
            height: 30,
          )
        ]),
      );
    });
  }
}
