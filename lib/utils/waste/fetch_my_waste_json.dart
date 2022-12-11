import 'package:scity_mobile/models/waste/waste_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/config.dart';

Future<List<MyWaste>> fetchMyWaste(request) async {
  var resp = await request.get("${AppConfig.apiUrl}waste/json/");

  List<MyWaste> listMyWaste = [];
  for (var data in resp) {
    if (data == null) continue;
    listMyWaste.add(MyWaste.fromJson(data));
  }

  return listMyWaste;
}