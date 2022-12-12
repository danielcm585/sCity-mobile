import 'dart:convert';

import 'package:scity_mobile/config.dart';
import 'package:http/http.dart' as http;

class FetchTourism {
  getDataPlace() async {
    Uri uri = Uri.parse('http://localhost:8000/tourism/json');

    var result = await http.get(
      uri,
      headers:<String, String> {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
    );
    // print(result);
    if (result.statusCode == 200) {
      var jsonString = result.body;
      var jsonMap = json.decode(jsonString);
      return jsonMap;
    }
  }
}
