import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/pages/home/home_page.dart';

void handleLogout(context, request) async {
  final resp = await request.logout("${AppConfig.apiUrl}authentication/api/logout/");

  if (resp['status']) {
    Fluttertoast.showToast(
      msg: resp['message'],
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