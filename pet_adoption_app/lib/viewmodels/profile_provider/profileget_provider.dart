import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_adoption_app/models/profile_model/profile_model.dart';
import 'package:pet_adoption_app/services/api_services.dart';

class ProfileGetProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProfileModel ?_profileModelData;
 
 ProfileModel ?get profileModelData=>_profileModelData;

 

  Future<ProfileModel?> getProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiServices.get("users/profile");

      if (response.statusCode == 200) {
      ProfileModel  profileData = ProfileModel.fromJson(response.data);
      _profileModelData=profileData;
      return profileData;
      

      }
    } catch (e) {
      log("error in ProfileGetProvider $e");
      return null;
    }finally{
      _isLoading=false;
      notifyListeners();
    }
     return null;
  }
}
