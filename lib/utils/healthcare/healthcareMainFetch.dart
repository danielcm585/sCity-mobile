import 'package:scity_mobile/config.dart';
import 'dart:convert';
import 'package:scity_mobile/models/healthcare/healthcareModels.dart';
import 'package:http/http.dart' as http;
Future<List<healthcareModels>> fetchData(request) async {
    Uri uri = Uri.parse("${AppConfig.apiUrl}healthcare/json/");
    var res = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    if (res.statusCode == 200) {
      var jsonMap = json.decode(res.body);
      return jsonMap;
    } else {
      throw Exception('Failed to load data');
    }
  }