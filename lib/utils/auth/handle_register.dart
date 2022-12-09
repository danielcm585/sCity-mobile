import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/pages/auth/login_page.dart';

void handleRegister(context, request, username, password, confirmPassword) async {
  final resp = await request.post("${AppConfig.apiUrl}/authentication/api/register/", {
    'username': username,
    'password1': password,
    'password2': confirmPassword
  });
  
  if (resp['status']) {
    Fluttertoast.showToast(
      msg: resp['message'],
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
  else {
    Fluttertoast.showToast(
      msg: resp['message'],
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}