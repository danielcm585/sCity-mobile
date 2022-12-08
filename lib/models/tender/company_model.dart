import 'dart:convert';

List<Company> companyFromJson(String str) => List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Company {
  Company({
    required this.id,
    required this.companyName,
    required this.ptName,
    required this.npwp,
    required this.createdAt,
    required this.editedAt,
  });

  int id;
  String companyName;
  String ptName;
  String npwp;
  DateTime createdAt;
  DateTime editedAt;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json['id'],
    companyName: json['company_name'],
    ptName: json['pt_name'],
    npwp: json['npwp'],
    createdAt: DateTime.parse(json['created_at']),
    editedAt: DateTime.parse(json['edited_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'company_name': companyName,
    'pt_name': ptName,
    'npwp': npwp,
    'created_at': createdAt,
    'edited_at': editedAt,
  };
}