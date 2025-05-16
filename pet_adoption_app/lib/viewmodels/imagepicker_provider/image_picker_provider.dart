import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  List<File> fileImage = [];
  final imagepicker = ImagePicker();

  //camera provider

  Future<File?> cameraTakingPhoto() async {
    try {
      final xfile = await imagepicker.pickImage(source: ImageSource.camera);

      if (xfile != null) {
        fileImage.add(File(xfile.path));
        notifyListeners();
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
        log(fileImage.last.toString());
        log(fileImage.length.toString());
        notifyListeners();
        return file;
      }
    } catch (e) {
      log("error occured when taking photo from gallery $e");
    }
    return null;
  }
}
