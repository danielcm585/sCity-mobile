import 'package:scity_mobile/config.dart';
import 'package:scity_mobile/models/tender/company_model.dart';

Future<List<Company>> fetchMyCompanies(request) async {
  var resp = await request.get("${AppConfig.apiUrl}tender/api/company/mine/");

  List<Company> listCompany = [];
  for (var data in resp) {
    if (data == null) continue;
    listCompany.add(Company.fromJson(data));
  }
  
  return listCompany;
}