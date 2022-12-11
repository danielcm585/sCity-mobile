import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';

Future<void> createNewRegistrant(context, request, refresh, projectId, wasteType, weight) async {
  final resp = await request.post("${AppConfig.apiUrl}/waste/add/", {
    'waste_type': wasteType.toString(),
    'weight': weight.toString()
  });

  if (resp['status'] < 400) {
    Fluttertoast.showToast(
      msg: 'New Wastee Added',
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