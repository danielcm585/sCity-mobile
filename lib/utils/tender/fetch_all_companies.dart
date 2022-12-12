import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/models/tender/company_model.dart';

Future<List<Company>> fetchAllCompanies() async {
  var resp = await http.get(
    Uri.parse("${AppConfig.apiUrl}tender/api/company/"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  
  var datas = jsonDecode(utf8.decode(resp.bodyBytes));

  List<Company> listCompany = [];
  for (var data in datas) {
    if (data == null) continue;
    listCompany.add(Company.fromJson(data));
  }
  
  return listCompany;
}