import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/viewmodels/pet_details_provider/pet_add_provider/pet_details_add_provider.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/pageview/add_pet_page1.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/pageview/add_pet_page2.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/pageview/add_pet_page3.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/pageview/add_pet_page4.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  PetProfileModel? petProfile = PetProfileModel();
  final _pageController = PageController();

  void nextPageView() {
    _pageController.nextPage(
        curve: Curves.easeInOut, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F0E6), // original app color
        body: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // IconButton(
                //   onPressed: () {
                //     _pageController.previousPage(duration:Duration(milliseconds: 400), curve: Easing.legacyAccelerate);
                //   },
                //   icon: Icon(
                //     Icons.arrow_back,
                //     size: 30.w,
                //     color: Color(0xFFB39DDB), // soft lavender
                //   ),
                // ),
                SizedBox(),
                TextWidget(
                  words: "Add Pet",
                  color: Color(0xFF212121), // dark text
                  fontWeight: FontWeight.bold,
                  fontSize: 25.spMin,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    size: 30.w,
                    color: Color(0xFFB39DDB), // soft lavender
                  ),
                ),
              ],
            ),
            indicator(),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                 

                  //page1
                  AddPetPage1(
                    onTap: (petprofiledetails) {
                      petProfile = petprofiledetails;

                      nextPageView();
                      // log(petProfile!.petName.toString());
                      // log(petProfile?.description ?? "default");
                    },
                    petProfile: petProfile,
                  ),
                  //page 1 End......

                  //Page2
                  AddPetPage2(
                    petModelDataEnter: petProfile,
                    onChange: (petprofileData) {
                      petProfile = petprofileData;

                      log(petProfile!.petName.toString());
                      log(petProfile?.description ?? "no");
                      log(petProfile!.vaccinationStatus.toString());
                      log(petProfile!.isTrained.toString());
                      nextPageView();
                    },
                  ),

                  //page2 End......

                  //page 3
                  AddPetPage3(
                    petProfileModel: petProfile,
                    onChange: (passPetProfile) {
                      if (passPetProfile.location != null) {
                        petProfile?.location?.place =
                            passPetProfile.location!.place;
                        petProfile?.location?.latitude =
                            passPetProfile.location?.latitude;
                        petProfile?.location?.longitude =
                            passPetProfile.location?.longitude;
                            petProfile?.imageUrls=passPetProfile.imageUrls?.toList();
                        nextPageView();
                      }
                    },
                  ),

                  //end

                  //pageview4
                  Consumer<PetDetailsAddProvider>(
                    builder: (context, value, child){
                      return AddPetPage4(petProfileModel: petProfile,onchange: (passPetProfile) async{
                      
                        if(passPetProfile.contactDetails!=null){
                          petProfile?.contactDetails?.name=passPetProfile.contactDetails!.name;
                          petProfile?.contactDetails?.email=passPetProfile.contactDetails!.email;
                          petProfile?.contactDetails?.phoneNumber=passPetProfile.contactDetails!.phoneNumber;
                          petProfile?.contactDetails?.image=passPetProfile.contactDetails!.image;
                          log(petProfile!.contactDetails!.name.toString());
                        }
                        
                        log('========= PET PROFILE LOG =========');
                      log('Pet Name: ${petProfile?.petName}');
                      log('Type: ${petProfile?.type}');
                      log('Breed: ${petProfile?.breed}');
                      log('Age: ${petProfile?.age}');
                      log('Weight: ${petProfile?.weight}');
                      log('Gender: ${petProfile?.gender}');
                      log('Description: ${petProfile?.description}');
                      log('Health Status: ${petProfile?.healthStatus}');
                      log('Vaccination Status: ${petProfile?.vaccinationStatus}');
                      log('Breeding First Time: ${petProfile?.breedingFirstTime}');
                      log('Pedigree Certified: ${petProfile?.pedigreeCertified}');
                      log('Size: ${petProfile?.size}');
                      log('Friendly with Other Pets: ${petProfile?.friendlyWithOtherPets}');
                      log('Good with Kids: ${petProfile?.goodWithKids}');
                      log('Is Trained: ${petProfile?.isTrained}');
                      log('Special Needs: ${petProfile?.specialNeeds?.join(", ") ?? "None"}');
                      log('Image URLs: ${petProfile?.imageUrls?.join(", ") ?? "No images"}');
                      
                      log('Location:');
                      log('  Place:${petProfile?.location?.place}');
                      log('  Latitude: ${petProfile?.location?.latitude}');
                      log('  Longitude: ${petProfile?.location?.longitude}');
                      
                      log('Available for Adoption: ${petProfile?.availableForAdoption}');
                      
                      log('Contact Details:');
                      log('  Name: ${petProfile?.contactDetails?.name}');
                      log('  Phone: ${petProfile?.contactDetails?.phoneNumber}');
                      log('  Email: ${petProfile?.contactDetails?.email}');
                      log('  Image: ${petProfile?.contactDetails?.image}');
                      log('====================================');
                      await value.petDetailsAdd(petProfile);
                      
                      },);
                    }
                  ),

                  //end
                ],
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       nextPageView();
            //     },
            //     child: Text("clicknext")),
            // ElevatedButton(
            //     onPressed: () {
            //       _pageController.previousPage(
            //           duration: Duration(milliseconds: 300),
            //           curve: Easing.emphasizedAccelerate);
            //     },
            //     child: Text("clicknext"))
          ],
        ),
      ),
    );
  }

  Widget indicator() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, bottom: 30.h),
        child: SmoothPageIndicator(
          controller: _pageController,
          count: 5,
          effect: WormEffect(
            activeDotColor: Color(0xFFB388FF),type: WormType.thinUnderground,
            dotColor: Color(0xFFDADADA),paintStyle: PaintingStyle.stroke,
            dotHeight: 14.h,
            dotWidth: 12.h,
            spacing: 16.w,
          ),
        ),
      ),
    );
  }
}
