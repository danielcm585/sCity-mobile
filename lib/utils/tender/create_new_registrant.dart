import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';

Future<void> createNewRegistrant(context, request, refresh, projectId, companyId, offerPrice) async {
  final resp = await request.post("${AppConfig.apiUrl}tender/api/v2/registrant/${projectId.toString()}/", {
    'company_id': companyId.toString(),
    'offer_price': offerPrice.toString()
  });

  if (resp['status'] < 400) {
    Fluttertoast.showToast(
      msg: 'Perusahaan baru berhasil disimpan',
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