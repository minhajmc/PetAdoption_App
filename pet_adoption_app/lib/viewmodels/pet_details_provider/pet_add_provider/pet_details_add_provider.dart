import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/services/api_services.dart';

class PetDetailsAddProvider extends ChangeNotifier {
  bool isLoading = false;
  String? message;

  Future<void> petDetailsAdd(PetProfileModel? petModel) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await ApiServices.post("pets/", petModel?.toJson());

      if (response.statusCode == 200) {
        log(response.data.toString());
      }
    } catch (e) {
      log("error when giving pet details to api $e");
    }
  }
}
