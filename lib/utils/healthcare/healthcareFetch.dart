import 'dart:convert';
import 'package:scity_mobile/models/healthcare/healthcareModels.dart';
import 'package:http/http.dart' as http;
import 'package:scity_mobile/config.dart';
import 'package:flutter/material.dart';
import 'package:scity_mobile/pages/healthcare/healthcareMainPage.dart';
class healthcareFetch {
  Future<List<healthcareModels>> getData(request) async {
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

  void addData(
      BuildContext context,
      var request,
      String username,
      String keluhan,
      DateTime appointmentDate,
      int phoneNumber,
      ) async {
    var res = await request.post(
      "${AppConfig.apiUrl}healthcare/add_flutter/",
      {
        'username': username,
        'keluhan': keluhan,
        'appointment_date': appointmentDate.toString(),
        'phone_number': phoneNumber.toString(),
      },
    );
    print(res);
    if (res['status'] = true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("data added"),
      ));
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HealthcarePage())
      );
    }
  }
}
