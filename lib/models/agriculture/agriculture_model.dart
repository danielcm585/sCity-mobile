// To parse this JSON data, do
//
//     final agriculture = agricultureFromJson(jsonString);

import 'dart:convert';

List<Agriculture> agricultureFromJson(String str) => List<Agriculture>.from(json.decode(str).map((x) => Agriculture.fromJson(x)));

String agricultureToJson(List<Agriculture> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Agriculture {
    Agriculture({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Agriculture.fromJson(Map<String, dynamic> json) => Agriculture(
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
        required this.photoUrl,
        required this.title,
        required this.description,
        required this.price,
        required this.contactName,
        required this.contactNumber,
    });

    String photoUrl;
    String title;
    String description;
    int price;
    String contactName;
    String contactNumber;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        photoUrl: json["photo_url"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        contactName: json["contact_name"],
        contactNumber: json["contact_number"],
    );

    Map<String, dynamic> toJson() => {
        "photo_url": photoUrl,
        "title": title,
        "description": description,
        "price": price,
        "contact_name": contactName,
        "contact_number": contactNumber,
    };
}
