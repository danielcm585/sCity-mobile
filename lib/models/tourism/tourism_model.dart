class TourismModel {
  String? model;
  int? pk;
  Fields? fields;

  TourismModel({this.model, this.pk, this.fields});

  TourismModel.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    return data;
  }
}

class Fields {
  String? name;
  String? description;
  int? price;
  String? image;
  int? visitor;

  Fields({this.name, this.description, this.price, this.image, this.visitor});

  Fields.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    visitor = json['visitor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['visitor'] = this.visitor;
    return data;
  }
}