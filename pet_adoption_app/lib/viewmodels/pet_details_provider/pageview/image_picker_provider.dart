import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption_app/services/cloudinary_service/cloudinary_service.dart';

class ImagePickerProvider extends ChangeNotifier {
  List<File> fileImage = [];
  List<XFile> xfileImage = [];
  List<String> imagesFromCloudinaryurl = [];
  static final imagepicker = ImagePicker();
  bool isGivingToCloudinary=false;

  //camera provider

  Future<File?> cameraTakingPhoto() async {
    try {
      final xfile = await imagepicker.pickImage(source: ImageSource.camera);

      if (xfile != null) {
        fileImage.add(File(xfile.path));

        xfileImage.add(xfile);
        // String fileimage = xfile.path;
        notifyListeners();

        // final imagesfmClodnry = await CloudinaryService.uploadImageToCloudinary(
        //     "pet_image", fileimage);
        // if (imagesfmClodnry != null) {
        //   imagesFromCloudinary.add(imagesfmClodnry);
        // }
        // notifyListeners();

        return File(xfile.path);
      } else {
        return null;
      }
    } catch (e) {
      log("Error from when Camera Picture $e");
    }
    return null;
  }
  //gallery provider

  Future<List<File>?> galleryTakingPhoto() async {
    try {
      final List<XFile?> xfile = await imagepicker.pickMultiImage();
      if (xfile.isNotEmpty) {
        final file = xfile
            .whereType<XFile>()
            .map(
              (xfile) => File(xfile.path),
            )
            .toList();

        fileImage.addAll(file);
        xfileImage.addAll(xfile.whereType<XFile>());
        log(fileImage.last.toString());
        log(fileImage.length.toString());
        notifyListeners();
        // await Future.wait(xfile.map(
        //   (xfileImage) async {
        //     final imagesfrmCloudnry =
        //         await CloudinaryService.uploadImageToCloudinary(
        //             "pet_image", xfileImage!.path);
        //     imagesFromCloudinary.add(imagesfrmCloudnry!);
        //   },
        // ));
        return file;
      }
    } catch (e) {
      log("error occured when taking photo from gallery $e");
    }
    return null;
  }

  Future<void> uploadimageToClodinary() async {
    isGivingToCloudinary=true;
    notifyListeners();
    try{
    if(xfileImage.isNotEmpty){
        await Future.wait(xfileImage.map(
          (xfileimage) async {
            final imagesfrmCloudnry =
                await CloudinaryService.uploadImageToCloudinary(
                    "pet_image", xfileimage.path);
            imagesFromCloudinaryurl.add(imagesfrmCloudnry!);
          },
        ));
         isGivingToCloudinary=false;
    notifyListeners();
    }else{
       isGivingToCloudinary=false;
    notifyListeners();
       null;
    }
    }catch(e){
      log("error from when we giving images to cloudinary $e");
       isGivingToCloudinary=false;
    notifyListeners();
    }finally{
       isGivingToCloudinary=false;
    notifyListeners();
    }


  }

  void deleteImage(int index) async {
    if (fileImage != null || fileImage.isNotEmpty) {
      fileImage.removeAt(index);
      xfileImage.removeAt(index);
      notifyListeners();
    }
  }
}
