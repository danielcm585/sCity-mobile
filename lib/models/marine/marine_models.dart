// To parse this JSON data, do
//
//     final marine = marineFromJson(jsonString);

import 'dart:convert';

List<Marine> marineFromJson(String str) => List<Marine>.from(json.decode(str).map((x) => Marine.fromJson(x)));

String marineToJson(List<Marine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Marine {
    Marine({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Marine.fromJson(Map<String, dynamic> json) => Marine(
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
        required this.photoUrl,
        required this.title,
        required this.description,
        required this.price,
        required this.contactName,
        required this.contactNumber,
    });

    dynamic user;
    String photoUrl;
    String title;
    String description;
    int price;
    String contactName;
    String contactNumber;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        photoUrl: json["photo_url"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        contactName: json["contact_name"],
        contactNumber: json["contact_number"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "photo_url": photoUrl,
        "title": title,
        "description": description,
        "price": price,
        "contact_name": contactName,
        "contact_number": contactNumber,
    };
}
