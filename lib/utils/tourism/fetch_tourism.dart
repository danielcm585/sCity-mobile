import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scity_mobile/config.dart';
import 'package:http/http.dart' as http;
import 'package:scity_mobile/pages/tourism/place_list_page.dart';

class FetchTourism {
  getDataPlace() async {
    Uri uri = Uri.parse('${AppConfig.apiUrl}tourism/json');

    var result = await http.get(
      uri,
      headers: <String, String>{
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

  addPlace(BuildContext context, var request, String name, String desc,
      String price, String image) async {
    var result = await request.post(
      "${AppConfig.apiUrl}tourism/add_flutter/",
      {'name': name, 'description': desc, 'price': price, 'image': image},
    );
    print(result);
    if (result['status'] = true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Place berhasil ditambahkan"),
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PlaceListPage()));
    }
  }

  addVisitor(BuildContext context, var request, String pkPLace) async {
    var result = await request.get(
      "${AppConfig.apiUrl}tourism/add_visitor_flutter/$pkPLace",
    );
    if (result['status'] = true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Visitor berhasil ditambahkan"),
      ));
    }
  }

  Future<bool> checkAdmin(var request) async {
    var result = await request.get(
      "${AppConfig.apiUrl}tourism/adminCheck",
    );
    if (result['status'] == 201) {
      return true;
    } else {
      return false;
    }
  }
}
