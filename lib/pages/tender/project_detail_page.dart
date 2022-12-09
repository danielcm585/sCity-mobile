import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/components/tender/registrant_item.dart';
import 'package:scity_mobile/models/tender/project_model.dart';
import 'package:scity_mobile/pages/tender/new_registrant_page.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key,
    required this.data,
    required this.refresh,
  });

  final Project data;
  final VoidCallback refresh;

  @override
  State<ProjectDetailPage> createState() => ProjectDetailPageState();
}

class ProjectDetailPageState extends State<ProjectDetailPage> {
  void refresh() {
    widget.refresh();
    setState(() { });
  }

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
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 6),
            Text(widget.data.description),
            const SizedBox(height: 10),
            const Text(
              'Registrants',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 6),
            Text("${widget.data.registrants!.length} registrants"),
            const SizedBox(height: 10),
            (
              widget.data.registrants!.isNotEmpty ? 
                GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 30/5,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: widget.data.registrants!.map<Widget>((data) => RegistrantItem(data: data)).toList(),
                ) :
                Container()
            )
          ],
        )
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.only(bottom: 30, left: 14, right: 14),
        width: double.maxFinite,
        height: 50,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(0x10,0xb9,0x81,1)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            )
          ),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => NewRegistrantPage(project: widget.data, refresh: refresh)),
            );
          },
          child: const Text(
            'Register',
            style: TextStyle(
              fontSize: 16,
            )
          )
        )
      ),
    );
  }
}