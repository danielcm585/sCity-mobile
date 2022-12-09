import 'dart:convert';

List<SimpleProject> projectFromJson(String str) => List<SimpleProject>.from(json.decode(str).map((x) => SimpleProject.fromJson(x)));

// String projectToJson(List<SimpleProject> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SimpleProject {
  SimpleProject({
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
  DateTime? closedAt;

  factory SimpleProject.fromJson(Map<String, dynamic> json) => SimpleProject(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    isClosed: json['is_closed'],
    createdAt: DateTime.parse(json['created_at']),
    editedAt: DateTime.parse(json['edited_at']),
    closedAt: (json['closed_at'] != null ? DateTime.parse(json['closed_at']) : null),
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