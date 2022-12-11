import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';

Future<void> createNewWaste(context, request, wasteType, weight) async {

  final resp = await request.post("${AppConfig.apiUrl}waste/api/add/", {
    'waste_type': wasteType.toString(),
    'weight': weight.toString()
  });

  if (resp['status'] < 400) {
    Fluttertoast.showToast(
      msg: 'New Waste Added',
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