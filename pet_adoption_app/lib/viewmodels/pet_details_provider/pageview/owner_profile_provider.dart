import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption_app/services/cloudinary_service/cloudinary_service.dart';

class OwnerProfileProvider extends ChangeNotifier {
  String? cloudinaryProfileImage;
  XFile? xfileimage;
  File? fileimage;
  bool isimageGiving=false;

  Future<void> galleryProfile() async {
    try {
      final imagepicker = ImagePicker();

      final XfilePic = await imagepicker.pickImage(source: ImageSource.gallery);

      if (XfilePic != null) {
        xfileimage = XfilePic;
        fileimage = File(XfilePic.path);
        notifyListeners();
      }
    } catch (e) {
      log("error when picking wonerprofile $e");
    }
  }

  Future<void> giveImageToCloudinary() async {
    isimageGiving=true;
    notifyListeners();
    try {
      if (xfileimage != null) {
        final cloudinaryImage = await CloudinaryService.uploadImageToCloudinary(
            "pet_image", xfileimage!.path);
        cloudinaryProfileImage = cloudinaryImage;
        isimageGiving=false;
        notifyListeners();
      }
    } catch (e) {
      log("error when giving ownerprofilepic giving to cloudinary$e");
    }finally{
      isimageGiving=false;
      notifyListeners();

    }
  }
}
