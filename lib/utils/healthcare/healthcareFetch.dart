import 'package:scity_mobile/models/healthcare/healthcareModels.dart';

import 'package:scity_mobile/config.dart';

List<bool> appointmentStatusList = [];
Future<List<healthcareModels>> healthcareFetch(context) async {
  var response = await context.get(Uri.parse("${AppConfig.apiUrl}healthcare/json/"));
  List<healthcareModels> healthcareModelsList = [];
  for (var data in response) {
    if (data == null) continue;
    healthcareModelsList.add(healthcareModels.fromJson(data));
  }
  return healthcareModelsList;
}
