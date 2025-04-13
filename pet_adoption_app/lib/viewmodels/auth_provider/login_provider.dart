import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/services/api_services.dart';
import 'package:pet_adoption_app/services/bearer_token_service.dart';
import '../../models/model_login.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading=false;
  String? _errorMessage;
  bool _isLogged = false;

  bool? get isloading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool? get isLogged => _isLogged;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final loginData = LoginModel(email: email, password: password);
      final response = await ApiServices.post("users/login", loginData.toJson());

      if (response.statusCode == 200) {
        final token = response.data["access_token"];
        log("Token: $token");

        await BearerTokenService().saveToken(token);

        _isLogged = true;
        _errorMessage = "Login SuccessFull";
        notifyListeners();
      } else {
        _isLogged = false;
        notifyListeners();
      }
    } catch (e) {
      print("Catch Error $e");
      _isLogged = false;
      _errorMessage = "Login Failed";
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }

    
  }
}
