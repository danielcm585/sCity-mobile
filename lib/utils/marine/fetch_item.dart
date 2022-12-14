// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:scity_mobile/models/marine/marine_models.dart';
import 'package:scity_mobile/config.dart';
import 'dart:convert';

Future<List<Marine>> fetchMarine() async {
  var response = await http.get(
    Uri.parse("${AppConfig.apiUrl}marine/json/"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo

  List<Marine> listItem = [];
  for (var d in data) {

    if (d != null) {
      listItem.add(Marine.fromJson(d));
    }
  }
  return listItem;
}
