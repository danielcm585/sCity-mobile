import 'package:flutter/material.dart';
import 'package:scity_mobile/colors.dart';
import 'package:scity_mobile/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appColor,
        bottomAppBarColor: appColor,
        splashColor: appColor
      ),
      home: const HomePage(title: 'sCity'),
    );
  }
}