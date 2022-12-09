import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';

void createNewProject(context, request, refresh, title, description) async {
  final resp = await request.post("${AppConfig.apiUrl}/tender/api/v2/project/", {
    'title': title,
    'description': description
  });

  if (resp['status'] < 400) {
    Fluttertoast.showToast(
      msg: 'Projek baru berhasil disimpan',
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
    Navigator.pop(context);
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