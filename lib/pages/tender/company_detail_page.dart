import 'package:flutter/material.dart';
import 'package:scity_mobile/models/tender/company_model.dart';

class CompanyDetailPage extends StatefulWidget {
  const CompanyDetailPage({super.key,
    required this.data,
  });

  final Company data;

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}