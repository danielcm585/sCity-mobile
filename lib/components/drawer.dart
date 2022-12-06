import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/pages/auth/login_page.dart';
import 'package:scity_mobile/pages/auth/register_page.dart';
import 'package:scity_mobile/pages/tender/tender_main_page.dart';
import 'package:scity_mobile/providers/auth_provider.dart';
import 'package:scity_mobile/utils/auth/handle_logout.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 80),
          context.watch<CookieRequest>().loggedIn ? 
            Column(
              children: [
                ListTile(
                  title: const Text('Tender'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const TenderMainPage()),
                    );
                  }
                ),
                
                ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red
                    )
                  ),
                  onTap: () async {
                    final request = context.read<CookieRequest>();
                    handleLogout(context, request);
                  }
                ),
              ],
            ) : 
            Column(
              children: [
                ListTile(
                  title: const Text('Login'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  }
                ),
                ListTile(
                  title: const Text('Register'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  }
                ),
              ],
            )
        ],
      )
    );
  }
}