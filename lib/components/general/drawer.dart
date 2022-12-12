import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/pages/auth/login_page.dart';
import 'package:scity_mobile/pages/auth/register_page.dart';
import 'package:scity_mobile/pages/tender/tender_main_page.dart';
import 'package:scity_mobile/utils/auth/handle_logout.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/pages/waste/waste_main_page.dart';
import 'package:scity_mobile/pages/healthcare/healthcareMainPage.dart';
import '../../pages/marine/main_marine.dart';
import 'package:scity_mobile/pages/tourism/place_list_page.dart';

import '../../pages/marine/main_marine.dart';

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
        context.watch<CookieRequest>().loggedIn
            ? Column(
                children: [
                  ListTile(
                      title: const Text('Tender'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TenderMainPage()),
                        );
                      }),
                  ListTile(
                      title: const Text('Waste Bank'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyWastePage()),
                        );
                      }),
                  ListTile(
                      title: const Text('Healthcare'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HealthcarePage()),
                        );
                      }),
                  ListTile(
                      title: const Text('Marine'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MarineMainPage()),
                        );
                      }),
                  ListTile(
                      title: const Text('Tourism'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceListPage()),
                        );
                      }),
                  ListTile(
                      title: const Text('Marine'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MarineMainPage()),
                        );
                      }),
                  ListTile(
                      title: const Text('Logout',
                          style: TextStyle(color: Colors.red)),
                      onTap: () async {
                        final request = context.read<CookieRequest>();
                        handleLogout(context, request);
                      }),
                ],
              )
            : Column(
                children: [
                  ListTile(
                      title: const Text('Login'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      }),
                  ListTile(
                      title: const Text('Register'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      }),
                ],
              )
      ],
    ));
  }
}
