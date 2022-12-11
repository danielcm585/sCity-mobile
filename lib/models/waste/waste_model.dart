// To parse this JSON data, do
//
//     final myWaste = myWasteFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<MyWaste> myWasteFromJson(String str) => List<MyWaste>.from(json.decode(str).map((x) => MyWaste.fromJson(x)));

String myWasteToJson(List<MyWaste> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWaste {
  MyWaste({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory MyWaste.fromJson(Map<String, dynamic> json) => MyWaste(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.user,
    required this.username,
    required this.date,
    required this.weight,
    required this.isConfirm,
    required this.wasteType,
  });

  int user;
  String username;
  DateTime date;
  int weight;
  bool isConfirm;
  String wasteType;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    username: json["username"],
    date: DateTime.parse(json["date"]),
    weight: json["weight"],
    isConfirm: json["is_confirm"],
    wasteType: json["waste_type"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "username": username,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "weight": weight,
    "is_confirm": isConfirm,
    "waste_type": wasteType,
  };
}
