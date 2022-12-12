import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';

Future<void> deleteWaste(context, request, id) async {

  final resp = await request.post("${AppConfig.apiUrl}waste/api/admin/delete/$id", {

  });

  if (resp['status'] < 400) {
    Fluttertoast.showToast(
      msg: 'Waste haste been removed',
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
    Navigator.pop(context);
  }
  else {
    Fluttertoast.showToast(
      msg: resp['message'],
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}