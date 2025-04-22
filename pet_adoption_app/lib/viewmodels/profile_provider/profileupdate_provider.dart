import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/models/profile_model/profile_model.dart';
import 'package:pet_adoption_app/services/api_services.dart';
import 'package:pet_adoption_app/services/cloudinary_service/cloudinary_service.dart';

class ProfileUpdateProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isUpdated = false;
  String? _statusMessage;
  String? imageUrlfrmCLoudinary;

  bool get isLoading => _isLoading;
  bool get isUpdated => _isUpdated;

  String? get statusMessage => _statusMessage;

  Future<void> submitProfileUpdate(
    String name,
    String phone,
    String imageUrl,

  ) async {
    _isLoading = true;
    _isUpdated = false;
    notifyListeners();

    if(imageUrl.isNotEmpty||imageUrl!=""){
         imageUrlfrmCLoudinary =
        await CloudinaryService.uploadImageToCloudinary(
            "user_profiles", imageUrl);
            notifyListeners();
    }
   

            

    try {
      ProfileModel profileData = ProfileModel(
          name: name, phone: phone, imageUrl: imageUrlfrmCLoudinary);
      final response =
          await ApiServices.put("users/profile", profileData.toJson());

      if (response.statusCode == 200) {
        _isUpdated = true;
        _statusMessage = "updated Successfully";
      } else {
        _statusMessage = "Failed To Update";
      }
    } catch (e) {
      log("error occured by $e");
      _statusMessage = "Failed To Update";
    } finally {
      _isLoading = false;
    }
    notifyListeners();
  }
}
