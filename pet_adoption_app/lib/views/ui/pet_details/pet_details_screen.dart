import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/views/ui/pet_details/pet_headersection.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:pet_adoption_app/widgets/pet_details/info_tags.dart';
import 'package:pet_adoption_app/widgets/pet_details/servicegficonbutton.dart';
import 'package:pet_adoption_app/widgets/pet_details/statue_info.dart';

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
              height: 0.38.sh,
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
                          fontSize: 18.spMin))
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
                    label: "Age",
                    value: "Adult",
                    backgroundColor: 0xFFE8EEFD),
                const InfoTags(
                    label: "Size",
                    value: "Medium",
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
                  backgroundImage: CachedNetworkImageProvider(
                      "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"),
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
                    ServiceGfIconButton(
                        backgroundColor: 0xFF25D366,
                        icon: FaIcon(FontAwesomeIcons.whatsapp)),
                    SizedBox(
                      width: 0.03.sw,
                    ),
                    ServiceGfIconButton(
                        backgroundColor: 0xFF4285F4,
                        icon: FaIcon(FontAwesomeIcons.envelope)),
                    SizedBox(
                      width: 0.03.sw,
                    ),
                    ServiceGfIconButton(
                        backgroundColor: 0xFF1EB980,
                        icon: FaIcon(FontAwesomeIcons.phone))
                  ],
                ),
              ),
            ),

            //contact end
            SizedBox(
              height: 15.h,
            ),

            //about

            TextWidget(
                words: "About ${"Mochi"}",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.spMin),
            SizedBox(
              height: 15.h,
            ),

            //description
            TextWidget(
              words:
                  "Meet Luna, a graceful 2-year-old Siamese with mesmerizing blue eyes and a coat like caramel dipped in moonlight. Playful yet dignified, she adores chasing feather toys and claiming sunbeams as her throne. Luna is spayed, up-to-date on vaccinations, and gets along well with other pets.",
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16.spMin,
            ),

            //description end
            SizedBox(
              height: 20.h,
            ),

            //bool value

            GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 3,
              children: [
                StatueInfo(label: "In Good Health    ", iswhatTrFa: true),
                StatueInfo(label: "Pedigree Certified", iswhatTrFa: true),
                StatueInfo(label: "FirstTime Breeder", iswhatTrFa: false),
                StatueInfo(label: " Vaccinated           ", iswhatTrFa: false),
                StatueInfo(label: "Friendly with Pets", iswhatTrFa: true),
                StatueInfo(label: "Trained                   ", iswhatTrFa: false),
                StatueInfo(label: "Good with Kids     " , iswhatTrFa: true),
                

                // if (pet.specialNeeds.isNotEmpty)
                StatueInfo(label: "HasSpecial Needs", iswhatTrFa: false)
                // else
                // StatueInfo(label: "No Special Needs", iswhatTrFa: false),
              ],
            )
          ],
        ),
      ),
    );
  }
}
