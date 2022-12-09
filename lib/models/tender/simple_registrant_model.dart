import 'dart:convert';

import 'package:scity_mobile/models/tender/simple_project_model.dart';

List<SimpleRegistrant> registrantFromJson(String str) => List<SimpleRegistrant>.from(json.decode(str).map((x) => SimpleRegistrant.fromJson(x)));

// String registrantToJson(List<SimpleRegistrant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SimpleRegistrant {
  SimpleRegistrant({
    required this.id,
    required this.project,
    required this.offerPrice,
    required this.registredAt,
    required this.isChosen,
  });

  int id;
  SimpleProject project;
  int offerPrice;
  DateTime registredAt;
  DateTime isChosen;

  factory SimpleRegistrant.fromJson(Map<String, dynamic> json) => SimpleRegistrant(
    id: json['id'],
    project: json['project'],
    offerPrice: json['offer_price'],
    registredAt: DateTime.parse(json['registred_at']),
    isChosen: json['is_chosen'],
  );

  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'company': company,
  //   'offer_price': offerPrice,
  //   'registered_at': registredAt,
  //   'is_chosen': isChosen,
  // };
}