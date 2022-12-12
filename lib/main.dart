import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/colors.dart';
import 'package:scity_mobile/models/marine/marine_models..dart';
import 'package:scity_mobile/pages/home/home_page.dart';
import 'package:scity_mobile/pages/marine/main_marine.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => CookieRequest()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sCity',
      theme: ThemeData(
        primarySwatch: appColor,
        bottomAppBarColor: appColor,
        splashColor: appColor
      ),
      home: const MarineMainPage(),
    );
  }
}