import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';

void addItem(context, request, refresh, title, description, contactName, contactNumber, price, photoURL) async {
  final resp = await request.post("${AppConfig.apiUrl}/agriculture/add-flutter", {
    'photo_url': photoURL,
    'title': title,
    'description': description,
    'price': price,
    'contact_name': contactName,
    'contact_number': contactNumber,
  });

  if (resp['status'] == 'success') {
    Fluttertoast.showToast(
      msg: 'Item baru berhasil disimpan',
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
