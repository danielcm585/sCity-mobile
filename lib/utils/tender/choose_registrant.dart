import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';

void chooseRegistrant(request, registrantId, refresh) async {
  final resp = await request.get("${AppConfig.apiUrl}tender/api/v2/registrant/choose/$registrantId/");

  if (resp['status'] < 400) {
    Fluttertoast.showToast(
      msg: resp['message'],
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
    refresh();
  }
  else {
    Fluttertoast.showToast(
      msg: resp['message'],
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}