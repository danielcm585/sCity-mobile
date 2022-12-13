import 'dart:convert';
List<Place> placesFromJson(String str) => List<Place>.from(json.decode(str).map((x) => Place.fromJson(x)));

class Place {
  Place({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.visitor,
  });
  String name;
  String description;
  int price;
  String image;
  int visitor;
  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
        visitor: json['visitor'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'image': image,
        'visitor': visitor,
      };
}
