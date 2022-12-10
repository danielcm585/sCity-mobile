import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/models/tender/project_model.dart';

Future<Project> fetchOneProjects(id) async {
  var resp = await http.get(
    Uri.parse("${AppConfig.apiUrl}tender/api/project/$id/"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  
  var data = jsonDecode(utf8.decode(resp.bodyBytes));
  return Project.fromJson(data);
}