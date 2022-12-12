import 'dart:convert';


List<Marine> marineFromJson(String str) => List<Marine>.from(json.decode(str).map((x) => Marine.fromJson(x)));

// String companyToJson(List<Company> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Marine {
  Marine({
    required this.title,
    required this.description,
    required this.contactName,
    required this.contactNumber,
    required this.price,
    required this.photoURL,
  });

  String title;
  String description;
  String contactName;
  String contactNumber;
  String price;
  String photoURL;

 

  factory Marine.fromJson(Map<String, dynamic> json) => Marine(
    title: json['title'],
    description: json['description'],
    contactName: json['contact_name'],
    contactNumber: json['contact_number'],
    price: json['price'],
    photoURL: json['photo_url'],
  );

  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'company_name': companyName,
  //   'pt_name': ptName,
  //   'npwp': npwp,
  //   'created_at': createdAt,
  //   'edited_at': editedAt,
  // };
}