import 'dart:convert';
import 'package:scity_mobile/models/tender/registrant_model.dart';

List<Project> projectFromJson(String str) => List<Project>.from(json.decode(str).map((x) => Project.fromJson(x)));

// String projectToJson(List<Project> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Project {
  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.isClosed,
    required this.createdAt,
    required this.editedAt,
    required this.closedAt,
    required this.registrants,
  });

  int id;
  String title;
  String description;
  bool isClosed;
  DateTime createdAt;
  DateTime editedAt;
  DateTime? closedAt;
  List<Registrant>? registrants;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    isClosed: json['is_closed'],
    createdAt: DateTime.parse(json['created_at']),
    editedAt: DateTime.parse(json['edited_at']),
    closedAt: (json['closed_at'] != null ? DateTime.parse(json['closed_at']) : null),
    registrants: (
      json['registrants'] != null ? 
        json['registrants']!.map<Registrant>((data) => Registrant.fromJson(data)).toList() : 
        null
    ),
  );

  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'title': title,
  //   'description': description,
  //   'is_closed': isClosed,
  //   'created_at': createdAt,
  //   'edited_at': editedAt,
  //   'closed_at': closedAt,
  // };
}