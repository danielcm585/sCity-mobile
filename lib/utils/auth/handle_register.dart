import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String,dynamic>> handleRegister(username, password) async {
  var formData = <String,dynamic>{};
  formData['username'] = username;
  formData['password'] = password;

  var jsonResp = await http.post(
    Uri.parse('https://scity.herokuapp.com/authentication/api/register/'),
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
    body: formData
  );
  var resp = jsonDecode(utf8.decode(jsonResp.bodyBytes));
  return resp;

  // return {
  //   'status': 200,
  //   'message': 'Register berhasil'
  // };
}