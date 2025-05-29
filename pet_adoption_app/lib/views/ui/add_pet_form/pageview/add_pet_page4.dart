import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/viewmodels/pet_details_provider/pageview/owner_profile_provider.dart';
import 'package:pet_adoption_app/widgets/authwidgets/elevatedButtonWidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/loading_animation_button.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:pet_adoption_app/widgets/pet_details/detailsformfield.dart';
import 'package:provider/provider.dart';

class AddPetPage4 extends StatelessWidget {
  final PetProfileModel? petProfileModel;
  final Function(PetProfileModel) onchange;
  AddPetPage4(
      {super.key, required this.petProfileModel, required this.onchange});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phonenumbController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Color(0xFFF9F7F1), // very light version of scaffold color
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                // SizedBox(height: 20.w,),
                TextWidget(
                    words: "Contact Details",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.spMin),
                SizedBox(
                  height: 30.w,
                ),
                Consumer<OwnerProfileProvider>(
                    builder: (context, ownerProfile, child) {
                  final fileimageprofile = ownerProfile.fileimage;
                  return GFAvatar(
                    size: 90.w,
                    backgroundImage: ownerProfile.fileimage != null
                        ? FileImage(fileimageprofile!)
                        : null,
                    backgroundColor:
                        Color(0xFFE3F2FD), // Light Blue (Friendly & Soft)
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        tooltip: "Add Image",
                        onPressed: () async {
                          await ownerProfile.galleryProfile();
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 35.w,
                          color: fileimageprofile != null
                              ? Color(0xFF9E9E9E)
                              : Color(0xFF5C6BC0),
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: 30.h,
                ),
                DetailsFormField(
                  focusNode: _nameFocusNode,
                  whereToFocus: _emailFocusNode,
                  hintText: "Enter Your Name",
                  inputType: TextInputType.text,
                  controller: _nameController,
                  maxLine: 1,
                ),
                SizedBox(
                  height: 30.h,
                ),
                DetailsFormField(
                   focusNode: _emailFocusNode,
                  whereToFocus: _phoneFocusNode,
                  hintText: "Enter Your Email",
                  inputType: TextInputType.text,
                  controller: _emailController,
                  maxLine: 1,
                ),

                SizedBox(
                  height: 30.h,
                ),
                IntlPhoneField(focusNode: _phoneFocusNode,
                
                    showCountryFlag: false,
                    controller: _phonenumbController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        hintText: "Phone Number"),
                    initialCountryCode: "IN",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (phoneNumber) {
                      if (phoneNumber == null || phoneNumber.number.isEmpty) {
                        return "Must Enter Phone Number";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 30.h,
                ),
                Consumer<OwnerProfileProvider>(
                    builder: (context, profile, child) {
                  return profile.isimageGiving == true
                      ?LoadingAnimationButton()
                      : ElevatedButtonWidget(
                          text: "Finish",
                          height: 50.h,
                          width: double.infinity,
                          elevation: 5,
                          backgroundColor: 0xFFB39DDB,
                          fontSize: 17.spMin,
                          textColor: Color(0xFF212121),
                          borderRadius: 12.r,
                          tap: () async {
                            
                            if (_formkey.currentState!.validate() &&
                                _phonenumbController.text.isNotEmpty) {
                                  await profile.giveImageToCloudinary();
                              log(profile.cloudinaryProfileImage.toString());

                              petProfileModel?.contactDetails = ContactDetails(
                                  name: _nameController.text,
                                  phoneNumber: _phonenumbController.text,
                                  email: _emailController.text,
                                  image: profile.cloudinaryProfileImage);
                              onchange(petProfileModel!);
                            }
                          },
                          borderColor: 0xFFB39DDB,
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
