import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/viewmodels/imagepicker_provider/image_picker_provider.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class AddPetPage3 extends StatelessWidget {
  AddPetPage3({super.key});
  List<File?> imagesofList = [];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  words: "Location Picker",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.spMin),
              SizedBox(
                height: 20.h,
              ),

              SlideAction(
                height: 60.h,
                sliderButtonYOffset: -8.w,
                sliderButtonIconSize: 40.w,
                onSubmit: () {
                  log("hek");
                  return;
                },
                borderRadius: Checkbox.width,
                outerColor: const Color.fromARGB(236, 237, 97, 84),
                innerColor: const Color.fromARGB(229, 255, 255, 255),
                sliderButtonIcon: Icon(
                  Icons.location_on,
                  size: 38.w,
                  color: Color(0xFFFF6F61),
                ),
                sliderRotate: false,
                child: TextWidget(
                    words: "Pick Location",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.spMin),
              ),

              SizedBox(
                height: 40.h,
              ),
              TextWidget(
                  words: "Upload Pet Image",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.spMin),
              SizedBox(
                height: 15.h,
              ),

              //image upload
              Material(
                color: Colors.white12,
                child: InkWell(
                  onTap: () {
                    log("clicked");
                    bottomSheetofTakingImage(context);
                  },
                  overlayColor: WidgetStatePropertyAll(
                    const Color.fromARGB(
                        60, 255, 111, 97), // soft warm orange-pink tone
                  ),
                  highlightColor: Colors.amber,
                  child: Container(
                    height: 60.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Icon(Icons.camera_alt_sharp),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextWidget(
                            words: "Upload",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.spMin)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              Consumer<ImagePickerProvider>(builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.fileImage.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: value.fileImage.isEmpty
                        ? null
                        : Image.file(
                            value.fileImage[index],
                            fit: BoxFit.cover,
                          ),
                  ),
                );
              }),

              ElevatedButton(onPressed: (){
                log(imagesofList.toString());
              }, child: Text("click"))
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheetofTakingImage(BuildContext context) {
    final imageprovider =
        Provider.of<ImagePickerProvider>(listen: false, context);
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              20,
            ),
            topLeft: Radius.circular(20)),
      ),
      backgroundColor: Color(0xFFFDF8F3), // Soft cream background
      context: context,
      builder: (context) {
        return SizedBox(
          height: 150.h,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 50.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  Take Picture
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final fileimage =
                            await imageprovider.cameraTakingPhoto();
                        if (fileimage != null) {
                          imagesofList.add(fileimage);
                        }
                        log(imagesofList.last.toString());
                      },
                      child: SizedBox(
                        height: 80.h,
                        width: 80.w,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              size: 35.w,
                              color: Color(0xFFEB1C20), // Red icon
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextWidget(
                      words: "Take Picture",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.spMin,
                    ),
                  ],
                ),

                // Divider
                Container(
                  height: 80.h,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Color(0xFFE0E0E0), // Light grey
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                //  Gallery
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final galleryImage =
                            await imageprovider.galleryTakingPhoto();
                        if (galleryImage != null) {
                          imagesofList.addAll(galleryImage);
                        } else {
                          return;
                        }
                      },
                      child: SizedBox(
                        height: 80.h,
                        width: 80.w,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.photo_library_outlined,
                              size: 35.w,
                              color:
                                  Color.fromARGB(255, 28, 100, 235), // Red icon
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextWidget(
                      words: "Gallery",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.spMin,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
