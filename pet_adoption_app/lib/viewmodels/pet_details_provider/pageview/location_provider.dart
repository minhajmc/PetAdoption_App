import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  bool isLocationPicked = false;
  Placemark? locationPlace;
  Position? position;
  String? message;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getCurrentLocation() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    try {
      // Check if location services are enabled
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        message = "Location services are disabled";
        isLocationPicked = false;
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Check for permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          message = "Location permissions are denied";
          isLocationPicked = false;
          _isLoading = false;
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        message = "Location permissions are permanently denied";
        isLocationPicked = false;
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Get current position
      Position currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Get place name
      await getPlaceFromCoordinate(currentPosition.latitude, currentPosition.longitude);

      // Update state
      position = currentPosition;
      isLocationPicked = true;
      message = "Successfully picked your location";

    } catch (e) {
      log("Error from location picking: $e");
      message = "Failed to get location";
      isLocationPicked = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPlaceFromCoordinate(double lat, double lng) async {
    try {
      final placeMarks = await placemarkFromCoordinates(lat, lng);
      if (placeMarks.isNotEmpty) {
        locationPlace = placeMarks.first;
        log("Location: ${locationPlace?.locality}");
      }
    } catch (e) {
      log("Error from decoding lat/lng to place: $e");
    }
  }
}
