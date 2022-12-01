import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scity_mobile/config.dart';

void handleRegister(context, username, password, confirmPassword) async {
  final request = context.watch<CookieRequest>();

  final resp = await request.post("${AppConfig.apiUrl}/authentication/api/register/", {
    'username': username,
    'password1': password,
    'password2': confirmPassword
  });
  
  // TODO: What's next??
}