import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/models/tender/company_model.dart';

Future<Company> fetchOneCompany(id) async {
  var resp = await http.get(
    Uri.parse("${AppConfig.apiUrl}tender/api/company/$id/"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  
  var data = jsonDecode(utf8.decode(resp.bodyBytes));
  return Company.fromJson(data);
}