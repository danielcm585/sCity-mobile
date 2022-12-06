import 'dart:convert';

List<Project> projectFromJson(String str) => List<Project>.from(json.decode(str).map((x) => Project.fromJson(x)));

String projectToJson(List<Project> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Project {
  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.isClosed,
    required this.createdAt,
    required this.editedAt,
    required this.closedAt,
  });

  int id;
  String title;
  String description;
  bool isClosed;
  DateTime createdAt;
  DateTime editedAt;
  DateTime closedAt;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    isClosed: json['is_closed'],
    createdAt: json['created_at'],
    editedAt: json['edited_at'],
    closedAt: json['closed_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'is_closed': isClosed,
    'created_at': createdAt,
    'edited_at': editedAt,
    'closed_at': closedAt,
  };
}