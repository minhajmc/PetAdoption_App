import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/viewmodels/pet_details_provider/pageview/location_provider.dart';
import 'package:pet_adoption_app/viewmodels/pet_details_provider/pet_get_provider/single_pet_details_provider.dart';
import 'package:pet_adoption_app/views/ui/pet_details/pet_details_shimmereffect.dart';
import 'package:pet_adoption_app/views/ui/pet_details/pet_headersection.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:pet_adoption_app/widgets/pet_details/info_tags.dart';
import 'package:pet_adoption_app/widgets/pet_details/servicegficonbutton.dart';
import 'package:pet_adoption_app/widgets/pet_details/statue_info.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher.dart';

class PetDetailsScreen extends StatelessWidget {
  final petid;
  const PetDetailsScreen({super.key, required this.petid});

//   Color favColor = isFavorited ? Color(0xFFE91E63) : Color(0xFFB0BEC5); // Pink for favorited, Blue-grey for not
// Color favIconColor = isFavorited ? Colors.white : Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SinglePetDetailsGetProvider>(
      context,
    );

    Future<double> calculateDistance() async {
      final locprovider = Provider.of<LocationProvider>(
        context,
      );

      final distanceinMeters = Geolocator.distanceBetween(
          locprovider.position!.latitude,
          locprovider.position!.longitude,
          provider.modeldataOfpet!.location!.latitude!.toDouble(),
          provider.modeldataOfpet!.location!.longitude!.toDouble());
      log(distanceinMeters.toString());
      final kmDistance = distanceinMeters / 1000;
      log(kmDistance.toString());
      return kmDistance;
    }

    return Scaffold(
        // persistentFooterButtons: [
        //   SizedBox(
        //     width: double.infinity,
        //     child: Row(
        //       children: [
        //         SizedBox(
        //           width: 20.w,
        //         ),
        //         GFIconButton(
        //             color: Color(0xFFB0BEC5),
        //             icon: Icon(
        //               Icons.favorite,
        //               color: Colors.grey[40],
        //             ),
        //             onPressed: () {},
        //             iconSize: 40.w,
        //             shape: GFIconButtonShape.circle),
        //         SizedBox(
        //           width: 20.w,
        //         ),
        //         Expanded(
        //           child: SlideAction(
        //             height: 60.h,
        //             onSubmit: () {
        //               print("clicked");
        //             },
        //             submittedIcon: Icon(Icons.connecting_airports),
        //             outerColor: Color.fromARGB(164, 30, 113, 185),
        //             innerColor: Colors.white,
        //             sliderButtonIconSize: 20.w,
        //           ),
        //         )
        //       ],
        //     ),
        //   )
        // ],

        bottomNavigationBar: BottomAppBar(
            color: GFColors.TRANSPARENT,
            child: provider.isLoading
                ? GFShimmer(
                    child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(13.r))),
                  ))
                : Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      GFIconButton(
                          color: Color(0xFFB0BEC5),
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.grey[40],
                          ),
                          onPressed: () {},
                          iconSize: 40.w,
                          shape: GFIconButtonShape.circle),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: SlideAction(
                          height: 60.h,
                          onSubmit: () {
                            log(MediaQuery.of(context).size.height.toString());
                            print("clicked");
                            return null;
                          },
                          submittedIcon: Icon(Icons.connecting_airports),
                          outerColor: Color.fromARGB(164, 30, 113, 185),
                          innerColor: Colors.white,
                          sliderButtonIconSize: 15.w,
                        ),
                      )
                    ],
                  )),
        backgroundColor: const Color(0xFFF5F0E6),
        body: provider.isLoading
            ? PetDetailsShimmereffect()
            : Padding(
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

                    GFCarousel(
                        height: 0.35.sh,
                        viewportFraction: 1.0,
                        enlargeMainPage: true,
                        hasPagination: true,
                        scrollPhysics:
                            provider.modeldataOfpet!.imageUrls!.length <= 1
                                ? NeverScrollableScrollPhysics()
                                : AlwaysScrollableScrollPhysics(),
                        passiveIndicator: Colors.white54,
                        activeIndicator: Colors.white,
                        autoPlay: true,
                        items: provider.modeldataOfpet!.imageUrls!.map(
                          (imgurl) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: SizedBox(
                                width: 1.sw,
                                child: CachedNetworkImage(
                                  imageUrl: imgurl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ).toList()),
                    // GFImageOverlay(
                    //   height: 0.35.sh,
                    //   borderRadius: BorderRadius.circular(20),
                    //   image: NetworkImage(
                    //     provider.modeldataOfpet!.imageUrls![0]),
                    //   width: 1.sw,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(20),
                    //     child: Align(
                    //         alignment: Alignment.bottomCenter,
                    //         child: Container(
                    //             padding: EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white10,
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             child: TextWidget(
                    //                 words: "1 / 2",
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 15))),
                    //   ),
                    // ),
                    //end image

                    SizedBox(
                      height: 20.h,
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.spMin),
                            children: [
                          TextSpan(
                              text: provider.modeldataOfpet?.petName ??
                                  "unknown"),
                          TextSpan(
                              text:
                                  "  (${provider.modeldataOfpet?.breed ?? "unknown"})",
                              style: TextStyle(
                                  color: const Color.fromARGB(174, 58, 57, 57),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.spMin)),
                        ])),
                    SizedBox(
                      height: 15.h,
                    ),

                    FutureBuilder(
                        future: calculateDistance(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return TextWidget(
                                words: "Calculating Distance",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.spMin);
                          }
                          final distance = snapshot.data;
                          return Row(
                            children: [
                              // Icon(
                              //   Icons.location_on_rounded,
                              //   size: 23.w,
                              //   color: Color(0xFFB98068),
                              // ),
                              SizedBox(
                                height: 40.h,
                                width: 40.w,
                                child: Lottie.asset(
                                    "assets/mainuislideimg/petdetails/location_animation.json",
                                    fit: BoxFit.cover),
                              ),

                              SizedBox(
                                width: 10.w,
                              ),
                              TextWidget(
                                  words:
                                      "${distance?.toStringAsFixed(1) ?? "unknown"} km",
                                  color: Color(0xFF6E4F3A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.spMin),
                              TextWidget(
                                  words:
                                      "  (${provider.modeldataOfpet?.location?.place ?? "unKnown"})",
                                  color: Color(0xFF6E4F3A),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13.spMin),
                            ],
                          );
                        }),

                    //location
                    SizedBox(
                      height: 20.h,
                    ),

                    //conatiner of showing male ,agw,size

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoTags(
                            label: "Gender",
                            value: provider.modeldataOfpet?.gender.toString() ??
                                "Unknown",
                            backgroundColor:
                                provider.modeldataOfpet?.gender.toString() ==
                                        "Male"
                                    ? 0xFFF5F5DC
                                    : 0xFFFBEAEA),
                        InfoTags(
                            label: "Age",
                            value:
                                " ${provider.modeldataOfpet?.age.toString() ?? "Unknown"} years",
                            backgroundColor: 0xFFE8EEFD),
                        InfoTags(
                            label: "Size",
                            value: provider.modeldataOfpet?.size.toString() ??
                                "Unknown",
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
                          backgroundColor: Colors.blue.shade100,
                          backgroundImage: CachedNetworkImageProvider(provider
                                  .modeldataOfpet?.contactDetails?.image ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL0ZPaTrhUTirOwz7dEn4sxkCE-wZQsZljqg&s"),
                        ),
                        title: TextWidget(
                            words:
                                "${provider.modeldataOfpet?.contactDetails?.name ?? "Unknown"} ",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.spMin),
                        subTitle: Wrap(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15.w,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            TextWidget(
                                words: provider.modeldataOfpet?.location?.place
                                        ?.split(",")
                                        .first
                                        .trim() ??
                                    "Unknown",
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.spMin),
                          ],
                        ),
                        icon: Row(
                          children: [
                            ServiceGfIconButton(
                                callback: () async {
                                  try {
                                    await launchUrl(Uri.parse(
                                        "https://wa.me/${provider.modeldataOfpet?.contactDetails?.phoneNumber ?? "000000000"}?text=Hi!%20I%27m%20interested%20in%20adopting%20a%20pet.%20Could%20you%20please%20share%20more%20details%3F"));
                                  } catch (e) {
                                    log("error when lauching whatsapp $e");
                                  }
                                },
                                backgroundColor: 0xFF25D366,
                                icon: FaIcon(FontAwesomeIcons.whatsapp)),
                            SizedBox(
                              width: 0.03.sw,
                            ),
                            ServiceGfIconButton(
                                callback: () async {
                                  try {
                                    await launchUrl(Uri.parse(
                                        "mailto:${provider.modeldataOfpet?.contactDetails?.email ?? "appowner@gmail.com"}?subject=Pet%20Adoption%20Inquiry&body=Hello,%0A%0AI'm interested in adopting a pet and would like more information. Please let me know the next steps.%0A%0AThank you."));
                                  } catch (e) {
                                    log("error when lauching email $e");
                                  }
                                },
                                backgroundColor: 0xFF4285F4,
                                icon: FaIcon(FontAwesomeIcons.envelope)),
                            SizedBox(
                              width: 0.03.sw,
                            ),
                            ServiceGfIconButton(
                                callback: () async {
                                  try {
                                    await launchUrl(Uri.parse(
                                        "tel:${provider.modeldataOfpet?.contactDetails?.phoneNumber ?? "9999999999"}"));
                                  } catch (e) {
                                    log("error when lauching PhoneCall $e");
                                  }
                                },
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
                        words:
                            "About ${provider.modeldataOfpet?.petName ?? "Unknown"}",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.spMin),
                    SizedBox(
                      height: 15.h,
                    ),

                    //description
                    TextWidget(
                      words:
                          "This adorable pet is waiting for a loving home 🐾${provider.modeldataOfpet?.description ?? "This adorable pet is waiting for a loving home."}",
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
                        StatueInfo(
                            label: "In Good Health    ",
                            iswhatTrFa: provider.modeldataOfpet!.healthStatus!),
                        StatueInfo(
                            label: "Pedigree Certified",
                            iswhatTrFa:
                                provider.modeldataOfpet!.pedigreeCertified!),
                        StatueInfo(
                            label: "FirstTime Breeder",
                            iswhatTrFa:
                                provider.modeldataOfpet!.breedingFirstTime!),
                        StatueInfo(
                            label: " Vaccinated           ",
                            iswhatTrFa:
                                provider.modeldataOfpet!.vaccinationStatus!),
                        StatueInfo(
                            label: "Friendly with Pets",
                            iswhatTrFa: provider
                                .modeldataOfpet!.friendlyWithOtherPets!),
                        StatueInfo(
                            label: "Trained                   ",
                            iswhatTrFa: provider.modeldataOfpet!.isTrained!),
                        StatueInfo(
                            label: "Good with Kids     ",
                            iswhatTrFa: provider.modeldataOfpet!.goodWithKids!),

                        // if (pet.specialNeeds.isNotEmpty)
                        StatueInfo(
                            label: "HasSpecial Needs",
                            iswhatTrFa:
                                provider.modeldataOfpet!.specialNeeds!.isEmpty
                                    ? false
                                    : true)
                        // else
                        // StatueInfo(label: "No Special Needs", iswhatTrFa: false),
                      ],
                    ),
                    // SizedBox(height: 20.h,),
                    if (provider.modeldataOfpet!.specialNeeds!.isNotEmpty) ...[
                      SizedBox(
                        height: 20.h,
                      ),
                      TextWidget(
                          words:
                              "Want Extra Care For ${provider.modeldataOfpet!.petName}",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.spMin),
                      SizedBox(
                        height: 10.h,
                      ),
                      ...provider.modeldataOfpet!.specialNeeds!
                          .map((need) => TextWidget(
                                words: "• $need",
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.spMin,
                              ))
                          
                    ]
                  ],
                ),
              ));
  }
}
