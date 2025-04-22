import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pet_adoption_app/models/profile_model/profile_model.dart';
import 'package:pet_adoption_app/viewmodels/profile_provider/profileget_provider.dart';
import 'package:pet_adoption_app/viewmodels/profile_provider/profileupdate_provider.dart';
import 'package:pet_adoption_app/widgets/authwidgets/snackbar.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  //direct saving image to this when cache image like pickimage = this
  File? fileImage;

  //from sharedpreferences
  String? fetchEmail;

  //fetched img url from api

  String? profileImageUrl;

  Future<void> fetchProfileData() async {
    final profileProvider =
        Provider.of<ProfileGetProvider>(context, listen: false);
    ProfileModel? profileModelData = await profileProvider.getProfile();
    if (profileModelData != null) {
      nameController.text = profileModelData.name.toString();
      phoneController.text = profileModelData.phone.toString();
      profileImageUrl = profileModelData.imageUrl;
    }
  }

  Future<String?> getEmailFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) async {
    //     // await fetchProfileData();
    //     fetchEmail = await getEmailFromPrefs();
    //   },
    // );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchEmail = await getEmailFromPrefs();
      await fetchProfileData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileGetProvider = Provider.of<ProfileGetProvider>(context,listen: true);
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: profileGetProvider.isLoading == true
          ? Container(
              width: 1.sw,
              height: 1.sh,
              color: Colors.black,
              child: Center(
                child: GFLoader(
                  size: 80.w,
                  type: GFLoaderType.square,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                // padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30.w,
                          ),
                        ),
                        TextWidget(
                            words: "Edit Profile",
                            color: Color(0xFF4E4E4E),
                            fontWeight: FontWeight.w900,
                            fontSize: 25.spMin),
                        IconButton(
                          onPressed: () async {
                            final profileUpdateProvider =
                                Provider.of<ProfileUpdateProvider>(context,
                                    listen: false);


                            await profileUpdateProvider.submitProfileUpdate(
                                nameController.text.trim(),
                                phoneController.text.trim(),
                                fileImage?.path ?? "");

                           if(profileUpdateProvider.isUpdated==true){
                            await profileGetProvider.getProfile();
                            
                             snackbar(
                                context,
                                "${profileUpdateProvider.statusMessage}",
                                0xFF4CAF50,
                                Icons.check_circle_outline_outlined);
                           }else{
                             snackbar(
                                context,
                                 "${profileUpdateProvider.statusMessage}",
                                0xFF4CAF50,
                                Icons.close_rounded);

                           }
                          },
                          icon: Icon(
                            Icons.check,
                            size: 30.w,
                            color: Color(0xFF4E4E4E),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),

                    //avathar Starting
                    GFAvatar(
                      backgroundColor: Color(0xFFFFE0B2),
                      backgroundImage: fileImage != null
                          ? FileImage(fileImage!)
                          : profileImageUrl != null
                              ? NetworkImage(profileImageUrl!)
                              : null,
                      size: 80.spMin,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () async {
                            await pickImage();
                          },
                          child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Icon(Icons.camera_alt_outlined,
                                  size: 20.w, color: Color(0xFF4E4E4E))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    //textfields
                    Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            words: "Name",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF2F2F2),
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextWidget(
                            words: "Email",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextField(
                            readOnly: true,
                            controller: TextEditingController(text: fetchEmail),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF2F2F2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(width: 10.0, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextWidget(
                              words: "Phone Number",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          SizedBox(
                            height: 10.h,
                          ),
                          IntlPhoneField(
                            controller: phoneController,
                            //   onSubmitted: (p0) {
                            //   log(p0);
                            // },
                            keyboardType: TextInputType.phone,
                            initialCountryCode: "IN",
                            decoration: InputDecoration(
                              hintText: "Enter Your Phone Number",
                              filled: true,
                              fillColor: Color(0xFFF2F2F2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    ));
  }

  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();

    try {
      final XFile? xfileimage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (xfileimage != null) {
        fileImage = File(xfileimage.path);
        setState(() {});
      } else {
        return;
      }
    } catch (e) {
      log("Error occure in Taking Image $e");
    }
  }
}
