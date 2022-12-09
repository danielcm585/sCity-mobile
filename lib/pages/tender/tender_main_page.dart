import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/components/tender/company_item.dart';
import 'package:scity_mobile/components/tender/project_item.dart';
import 'package:scity_mobile/pages/tender/all_companies_page.dart';
import 'package:scity_mobile/pages/tender/all_project_page.dart';
import 'package:scity_mobile/pages/tender/new_company_page.dart';
import 'package:scity_mobile/pages/tender/new_project_page.dart';
import 'package:scity_mobile/utils/tender/fetch_all_companies.dart';
import 'package:scity_mobile/utils/tender/fetch_all_projects.dart';

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
                  const Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
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
                        childAspectRatio: 20/10,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!
                          .sublist(0, min(int.parse(snapshot.data!.length.toString()),4))
                          .map<Widget>((data) => ProjectItem(data: data)).toList(),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => const AllProjectPage()),
                              );
                            }, 
                            child: const Text(
                              'All Projects >'
                            )
                          )

                        ],
                      )
                    ]
                  );
                }
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Companies',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const NewCompanyPage()),
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
                      'New Company'
                    )
                  ),
                ]
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: fetchAllCompanies(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator()
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Text("0 companies");
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${snapshot.data!.length} companies"),
                      const SizedBox(height: 6),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 20/10,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!
                          .sublist(0, min(int.parse(snapshot.data!.length.toString()),4))
                          .map<Widget>((data) => CompanyItem(data: data)).toList(),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => const AllCompaniesPage()),
                              );
                            }, 
                            child: const Text(
                              'All Companies >'
                            )
                          )
                        ],
                      )
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