import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/models/auth_model/model_register.dart';
import 'package:pet_adoption_app/services/api_services.dart';

class RegisterProvider extends ChangeNotifier {
  String? _errorMessage;
  bool isRegistered = false;

  bool isloading = false;

  String? get errorMessage => _errorMessage;

  Future<void> registerUser(String email, String name, String password) async {
    isloading = true;
    notifyListeners();
    try {
      ModelRegister modelDataRegister = ModelRegister(
          email: email.trim(), name: name.trim(), password: password.trim());
          // log("Sending registration data: ${modelDataRegister.toJson()}");


      final response =
          await ApiServices.post("users/register", modelDataRegister);
          log("Response data register: ${response.data}"); 
          // log("Registering user with data: ${response.data()}");


      if (response.statusCode == 200) {
        _errorMessage = "Registered SuccessFully";
        isRegistered = true;
      }
    } catch (e) {
      // _errorMessage = "Something went wrong: ${e.toString()}";
      
      isRegistered = false;
  if (e is DioException && e.response != null) {
    log("❌ Error from server: ${e.response?.data}");

    // Handle error message from backend, assuming it's in this format:
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      _errorMessage = data['detail'] ?? "Registration failed";
    } else {
      _errorMessage = "Registration failed";
    }
  } else {
    _errorMessage = "Check Your Network";
  }
  notifyListeners();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
