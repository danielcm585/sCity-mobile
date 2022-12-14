import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/models/tender/project_model.dart';

Future<List<Project>> fetchAllProjects() async {
  var resp = await http.get(
    Uri.parse("${AppConfig.apiUrl}tender/api/project/"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  
  var datas = jsonDecode(utf8.decode(resp.bodyBytes));

  List<Project> listProject = [];
  for (var data in datas) {
    if (data == null) continue;
    listProject.add(Project.fromJson(data));
  }
  
  return listProject;
}