import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String,dynamic>> handleLogin(username, password) async {
  var jsonResp = await http.post(
    Uri.parse('https://scity.herokuapp.com/authentication/api/login/'),
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'username': username,
      'password': password
    })
  );
  var resp = jsonDecode(utf8.decode(jsonResp.bodyBytes));
  return resp;
  
  // return {
  //   'status': 200,
  //   'message': 'Login berhasil'
  // };
}