import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/pages/home/home_page.dart';

void handleLogin(context, username, password) async {
  final request = context.watch<CookieRequest>();
  
  final resp = await request.login("${AppConfig.apiUrl}authentication/api/login/", {
    'username': username,
    'password': password
  });

  if (request.loggedIn) {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const HomePage()),
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