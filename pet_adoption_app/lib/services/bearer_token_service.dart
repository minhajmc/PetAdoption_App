import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BearerTokenService {
    Future<void> saveToken(String?token) async {
    if (token != null && token.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("bearerToken", token); 
      log("Token saved:$token");
    } else {
      debugPrint("No token found");
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("bearerToken");
    // log("Fetched token:$token ::sharedprefs");
    return token;
  }
}