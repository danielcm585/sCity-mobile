import 'dart:convert';
import 'package:scity_mobile/models/tender/company_model.dart';
import 'package:scity_mobile/models/tender/project_model.dart';

List<Registrant> registrantFromJson(String str) => List<Registrant>.from(json.decode(str).map((x) => Registrant.fromJson(x)));

// String registrantToJson(List<Registrant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Registrant {
  Registrant({
    required this.id,
    required this.company,
    required this.project,
    required this.offerPrice,
    required this.registeredAt,
    required this.isChosen,
  });

  int id;
  Company? company;
  Project? project;
  int offerPrice;
  DateTime registeredAt;
  bool isChosen;

  factory Registrant.fromJson(Map<String, dynamic> json) => Registrant(
    id: json['id'],
    company: (json['company'] != null ? Company.fromJson(json['company']) : null), 
    project: (json['project'] != null ? Project.fromJson(json['project']) : null), 
    offerPrice: json['offer_price'],
    registeredAt: DateTime.parse(json['registered_at']),
    isChosen: json['is_chosen'],
  );

  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'company': company,
  //   'offer_price': offerPrice,
  //   'registered_at': registeredAt,
  //   'is_chosen': isChosen,
  // };
}