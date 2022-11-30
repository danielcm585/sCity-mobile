import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String,dynamic>> handleLogout() async {
  var jsonResp = await http.post(
    Uri.parse('https://scity.herokuapp.com/authentication/api/logout/'),
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    }
  );
  var resp = jsonDecode(utf8.decode(jsonResp.bodyBytes));
  return resp;

  // return {
  //   'status': 200,
  //   'message': 'Logout berhasil'
  // };
}