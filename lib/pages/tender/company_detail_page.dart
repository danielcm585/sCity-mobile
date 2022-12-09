import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/components/tender/registrant_item.dart';
import 'package:scity_mobile/models/tender/company_model.dart';

class CompanyDetailPage extends StatefulWidget {
  const CompanyDetailPage({super.key,
    required this.data,
    required this.refresh,
  });

  final Company data;
  final VoidCallback refresh;

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  void refresh() {
    widget.refresh();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Company Detail',
          style: TextStyle(
            color: Colors.white
          )
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 30,
                  child: IconButton(
                    iconSize: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  widget.data.companyName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'PT Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 6),
            Text(widget.data.ptName),
            const SizedBox(height: 10),
            const Text(
              'NPWP',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 6),
            Text(widget.data.npwp),
            const SizedBox(height: 10),
            const Text(
              'Projects',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 6),
            Text("${widget.data.projects!.length} projects"),
            const SizedBox(height: 6),
            (
              widget.data.projects!.isNotEmpty ?
                GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 30/5,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: widget.data.projects!.map<Widget>((data) => RegistrantItem(data: data)).toList(),
                ) :
                Container()
            ),
          ],
        )
      ),
    );
  }
}