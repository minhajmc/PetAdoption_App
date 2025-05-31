import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/services/api_services.dart';

class SinglePetDetailsGetProvider extends ChangeNotifier {
  bool isLoading=false;
  PetProfileModel ?modeldataOfpet;


  Future<void>singlePetDetailsGet(String petid)async{
    isLoading=true;
    notifyListeners();

    try{
    final response=  await ApiServices.get("pets/$petid");
      if(response.statusCode==200){
        modeldataOfpet=PetProfileModel.fromJson(response.data);
        isLoading=false;
        log(modeldataOfpet!.imageUrls.toString());
        notifyListeners();
      }
    }catch(e){
      log("error when fetching single pet $e");
       isLoading=false;
        notifyListeners();
    }
  }
}