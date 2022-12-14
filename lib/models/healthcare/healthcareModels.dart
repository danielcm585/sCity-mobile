import 'dart:convert';

List<healthcareModels> healthcareModelsFromJson(String str) =>
    List<healthcareModels>.from(
        json.decode(str).map((x) => healthcareModels.fromJson(x)));

String healthcareModelsToJson(List<healthcareModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class healthcareModels {
  healthcareModels({
    required this.username,
    required this.keluhan,
    required this.appointmentDate,
    required this.phoneNumber,
    required this.appointmentStatus,
  });

  String username;
  String keluhan;
  DateTime appointmentDate;
  int phoneNumber;
  bool appointmentStatus;

  void changeStatus() {
    appointmentStatus = !appointmentStatus;
  }

  factory healthcareModels.fromJson(Map<String, dynamic> json) =>
      healthcareModels(
        username: json["fields"]["username"],
        keluhan: json["fields"]["keluhan"],
        appointmentDate: DateTime.parse(json["fields"]["appointment_date"]),
        phoneNumber: json["fields"]["phone_number"],
        appointmentStatus: json["fields"]["appointment_status"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "keluhan": keluhan,
        "appointment date": appointmentDate,
        "phone number": phoneNumber,
        "appointment status": appointmentStatus,
      };
}
