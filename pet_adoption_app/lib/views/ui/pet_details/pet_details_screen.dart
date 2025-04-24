import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/views/ui/pet_details/pet_headersection.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:pet_adoption_app/widgets/pet_details/info_tags.dart';
import 'package:pet_adoption_app/widgets/pet_details/servicegficonbutton.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            //pet headersection
            const PetHeaderSection(),
            //end headersection
            SizedBox(
              height: 30.h,
            ),

            //image part
            GFImageOverlay(
              height: 250.h,
              borderRadius: BorderRadius.circular(20),
              image: AssetImage(
                  "assets/mainuislideimg/carouselimg/cat_dog_img4.jpg"),
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextWidget(
                            words: "1 / 2",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15))),
              ),
            ),
            //end image

            SizedBox(
              height: 20.h,
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.spMin),
                    children: [
                  TextSpan(text: "Mochi"),
                  TextSpan(
                      text: "  (labour)",
                      style: TextStyle(
                          color: const Color.fromARGB(174, 58, 57, 57),
                          fontWeight: FontWeight.normal,
                          fontSize: 18))
                ])),
            SizedBox(
              height: 20.h,
            ),

            Row(
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 23.w,
                      color: Color(0xFFB98068),
                    ),
                    Container(
                      height: 2,
                      width: 15.w,
                      color: Color(0xFF8B5E3C),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                TextWidget(
                    words: "2.5 KM",
                    color: Color(0xFF6E4F3A),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                TextWidget(
                    words: "  (thalassery ,kannur)",
                    color: Color(0xFF6E4F3A),
                    fontWeight: FontWeight.normal,
                    fontSize: 15)
              ],
            ),

            //location
            SizedBox(
              height: 20.h,
            ),

            //conatiner of showing male ,agw,size

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const InfoTags(
                    label: "Gender",
                    value: "Male",
                    backgroundColor: 0xFFFBEAEA),
                const InfoTags(
                    label: "Gender",
                    value: "Male",
                    backgroundColor: 0xFFE8EEFD),
                const InfoTags(
                    label: "Gender",
                    value: "Male",
                    backgroundColor: 0xFFE9F6EF),
              ],
            ),
            // conatiner endng

            SizedBox(
              height: 20.h,
            ),

            //contact

            Card(
              color: Color(0xFFFFF8F0),
              elevation: 5,
              child: GFListTile(
                avatar: GFAvatar(
                  size: 40.w,
                ),
                title: TextWidget(
                    words: "Jhone",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.spMin),
                subTitle: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15.w,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    TextWidget(
                        words: "Kannur",
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.spMin),
                  ],
                ),
                icon: Row(
                  children: [
                        ServiceGfIconButton(backgroundColor:0xFF25D366 , icon: FaIcon(FontAwesomeIcons.whatsapp)),
                        SizedBox(width: 0.03.sw,),
                        ServiceGfIconButton(backgroundColor:0xFF4285F4 , icon: FaIcon(FontAwesomeIcons.envelope)),
                        SizedBox(width: 0.03.sw,),
                        ServiceGfIconButton(backgroundColor: 0xFF1EB980, icon: FaIcon(FontAwesomeIcons.phone))
                  ],
                ),
              ),
            )

            //contact end
          ],
        ),
      ),
    );
  }
}
