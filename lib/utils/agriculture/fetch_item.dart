// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:scity_mobile/config.dart';
import 'dart:convert';

import 'package:scity_mobile/models/agriculture/agriculture_model.dart';

Future<List<Agriculture>> fetchAgriculture() async {
  var response = await http.get(
    Uri.parse("${AppConfig.apiUrl}agriculture/json/"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo

  List<Agriculture> listItem = [];
  for (var d in data) {

    if (d != null) {
      listItem.add(Agriculture.fromJson(d));
    }
  }
  return listItem;
}