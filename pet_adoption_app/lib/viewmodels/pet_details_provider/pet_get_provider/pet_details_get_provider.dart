import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/services/api_services.dart';

class PetDetailsGetProvider extends ChangeNotifier {
  bool isLoading = false;
  List<PetProfileModel?> petProfileModelData = [];

  Future<void> petGetDetailsApi(String? type) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await ApiServices.getpetDetailsWithParms("pets/", type);

      if (response.statusCode == 200) {
        log("succesfully to fetch pet details: ${response.statusCode}");
        final List<dynamic> data = response.data;
       
       

        petProfileModelData = data
            .map(
              (e) => PetProfileModel.fromJson(e),
            )
            .toList();
            
        isLoading = false;
        notifyListeners();
      } else {
        log("Failed to fetch pet details: ${response.statusCode}");
      }
    } catch (e) {
      log("Error when fetching pet details From APi $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
