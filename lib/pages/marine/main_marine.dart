import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/pages/marine/new_item_page.dart';
import 'package:scity_mobile/utils/marine/fetch_item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MarineMainPage extends StatefulWidget {
  const MarineMainPage({super.key});

  @override
  State<MarineMainPage> createState() => _MarineMainPageState();
}

class _MarineMainPageState extends State<MarineMainPage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marine', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
          future: fetchMarine(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(254, 185, 0, 100)),
                ),
              );
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "There is no data yet :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => NewFishPage(refresh: refresh)),
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
                      'Add Fish'
                    )
                  ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 180, 167, 167),
                                            blurRadius: 1.0)
                                      ]),
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      "${snapshot.data![index].fields.title}",
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Rp. ${snapshot.data![index].fields.price}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          "${snapshot.data![index].fields.contactNumber}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )))
                  ],
                );
              }
            }
          }),
    );
  }
}


// children: [
//           TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => NewFishPage(refresh: refresh)),
//                 );
//               },
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                       const Color.fromRGBO(0x10, 0xb9, 0x81, 1)),
//                   foregroundColor: MaterialStateProperty.all(Colors.white),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ))),
//               child: const Text('New Company')),
//         ],