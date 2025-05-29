import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  bool isLocationPicked = false;
  Placemark ?locationPlcae;

  Position? position;
  String? message;
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        log('Location services are disabled.');
        message = "Location services are disabled";
        notifyListeners();
      }

      // Check for permission
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          log('Location permissions are denied');
          message = "Location permissions are denied";
          notifyListeners();
        }
      }

      if (permission == LocationPermission.deniedForever) {
        log('Location permissions are permanently denied.');
        message = "Location permissions are permanently denied";
        notifyListeners();
      }

      // Get location
      Position directposition = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      if (directposition.toString().isNotEmpty){
       await getPlaceFromCoordinate(directposition.latitude, directposition.longitude);

        message = "SuccesFully Picked Your Location";
        isLocationPicked = true;
        notifyListeners();
      }
      position = directposition;
      notifyListeners();
      log(directposition.accuracy.toString());
    } catch (e) {
      log("Error From Location picking$e");
    }
  }

 Future <void> getPlaceFromCoordinate(double lat, double lng)async{
    try{
      final placeMark=await placemarkFromCoordinates(lat, lng);
      if(placeMark.isNotEmpty){
        Placemark place=placeMark[0];
        locationPlcae=place;
        notifyListeners();
        log(place.locality.toString());
      }
    }catch(e){
      log("error from decoding ltd lng to place $e");
    }


  }
}
