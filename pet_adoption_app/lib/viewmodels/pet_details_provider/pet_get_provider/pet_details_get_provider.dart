import 'dart:developer';
import 'package:flutter/foundation.dart'; // for compute
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/services/api_services.dart';

class PetDetailsGetProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isPetNotAvailable = false;
  List<PetProfileModel?> petProfileModelData = [];

  Future<void> petGetDetailsApi(String? type) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await ApiServices.getpetDetailsWithParms("pets/", type);

      if (response.statusCode == 200) {
        log("Successfully fetched pet details: ${response.statusCode}");

        final List<dynamic> data = response.data;

        isPetNotAvailable = data.isEmpty;
        notifyListeners();

        // Use compute to parse in a background isolate
        petProfileModelData = await compute(parsePetProfiles, data);
      } else {
        log("Failed to fetch pet details: ${response.statusCode}");
      }
    } catch (e) {
      log("Error when fetching pet details from API: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

// 🔧 Top-level function for compute (must be outside the class)
List<PetProfileModel?> parsePetProfiles(List<dynamic> data) {
  return data.map((e) => PetProfileModel.fromJson(e)).toList();
}
