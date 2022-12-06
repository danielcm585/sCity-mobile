import 'package:flutter/material.dart';
import 'package:scity_mobile/components/drawer.dart';
import 'package:scity_mobile/utils/tender/fetch_preview_projects.dart';

class TenderMainPage extends StatefulWidget {
  const TenderMainPage({super.key});

  @override
  State<TenderMainPage> createState() => _TenderMainPageState();
}

class _TenderMainPageState extends State<TenderMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tender',
          style: TextStyle(
            color: Colors.white
          )
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Projects',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: fetchPreviewProjects(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator()
                  );
                }
                return Column(
                  children: [
                    Text("${snapshot.data!.length} projects"),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: snapshot.data!.map((data) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: const [
                            Text('HALO')
                          ]
                        )
                      ))
                    )
                  ]
                );
              }
            )
          ]
        )
      )
    );
  }
}