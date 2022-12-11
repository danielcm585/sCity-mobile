import 'package:scity_mobile/config.dart';

Future checkAdmin(request) async {
  var resp = await request.get("${AppConfig.apiUrl}waste/api/adminCheck/");
  var output = false;
  if (resp["message"] == "Admin"){
    output =  true;
  } else {
    output =  false;
  }
  return output;
}