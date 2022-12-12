import 'package:scity_mobile/models/waste/waste_model.dart';
import 'package:scity_mobile/config.dart';

Future<List<MyWaste>> fetchAdminWaste(request) async {
  var resp = await request.get("${AppConfig.apiUrl}waste/json/admin");

  List<MyWaste> listMyWaste = [];
  for (var data in resp) {
    if (data == null) continue;
    listMyWaste.add(MyWaste.fromJson(data));
  }

  return listMyWaste;
}