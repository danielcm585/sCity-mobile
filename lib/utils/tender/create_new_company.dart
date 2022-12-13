import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/config.dart';

void createNewCompany(context, request, refresh, name, ptName, npwp) async {
  final resp = await request.post("${AppConfig.apiUrl}tender/api/v2/company/", {
    'company_name': name,
    'pt_name': ptName,
    'npwp': npwp
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