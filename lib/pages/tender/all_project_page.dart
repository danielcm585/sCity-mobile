import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/components/tender/project_item.dart';
import 'package:scity_mobile/pages/tender/new_project_page.dart';
import 'package:scity_mobile/pages/tender/tender_main_page.dart';
import 'package:scity_mobile/utils/tender/fetch_all_projects.dart';

class AllProjectPage extends StatefulWidget {
  const AllProjectPage({super.key});

  @override
  State<AllProjectPage> createState() => _AllProjectPageState();
}

class _AllProjectPageState extends State<AllProjectPage> {
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
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20, left: 14, right: 14),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 30,
                        child: IconButton(
                          iconSize: 20,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute(builder: (context) => const TenderMainPage()),
                            );
                          }, 
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Projects',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const NewProjectPage()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(0x10,0xb9,0x81,1)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      )
                    ),
                    child: const Text(
                      'New Project'
                    )
                  ),
                ]
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: fetchAllProjects(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator()
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Text("0 projects");
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${snapshot.data!.length} projects"),
                      const SizedBox(height: 6),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 20/11,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!.map<Widget>((data) => ProjectItem(data: data)).toList(),
                      ),
                    ]
                  );
                }
              ),
            ]
          )
        ]
      )
    );
  }
}