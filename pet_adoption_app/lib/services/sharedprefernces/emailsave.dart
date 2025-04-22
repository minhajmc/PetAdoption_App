import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class EmailSave {

static Future<void>saveEmail(String email)async{
  final prefs=await SharedPreferences.getInstance();
  prefs.setString("email", email);
  log("Email saved: $email");
}
}