import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/models/tender/project_model.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key,
    required this.data
  });

  final Project data;

  @override
  State<ProjectDetailPage> createState() => ProjectDetailPageState();
}

class ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Project Detail',
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
                  widget.data.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 6),
            Text(widget.data.description),
          ],
        )
      )
    );
  }
}