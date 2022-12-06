import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/pages/home/home_page.dart';

void handleLogin(context, request, username, password) async {
  final resp = await request.login("${AppConfig.apiUrl}authentication/api/login/", {
    'username': username,
    'password': password
  });

  if (request.loggedIn) {
    Fluttertoast.showToast(
      msg: 'Selamat datang kembali',
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
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