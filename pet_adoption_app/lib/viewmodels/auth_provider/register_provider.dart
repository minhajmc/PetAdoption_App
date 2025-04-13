import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_adoption_app/models/model_register.dart';
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

      final response =
          await ApiServices.post("users/register", modelDataRegister);

      if (response.statusCode == 200) {
        _errorMessage = "Registered SuccessFully";
        isRegistered = true;
      } else {
        _errorMessage = "Register Failed";
        isRegistered = false;
      }
    } catch (e) {
      // _errorMessage = "Something went wrong: ${e.toString()}";
      isRegistered = false;
      notifyListeners();
      log(e.toString());
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
