import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/models/tourism/place_model.dart';

void createNewPlace(context, request, refresh, Place place) async {
  final resp = await request.post("${AppConfig.apiUrl}tender/api/v2/place/", place.toJson());

  if (resp['status'] < 400) {
    Fluttertoast.showToast(
      msg: 'Objek wisata baru berhasil disimpan',
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