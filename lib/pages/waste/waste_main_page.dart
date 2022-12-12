import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/utils/waste/fetch_my_waste_json.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/pages/waste/waste_detail_page.dart';
import 'package:scity_mobile/pages/waste/add_waste.dart';
import 'package:intl/intl.dart';
import 'package:scity_mobile/pages/waste/waste_admin_page.dart';

class MyWastePage extends StatefulWidget {
  const MyWastePage({Key? key}) : super(key: key);

  final String title = 'My Waste';

  @override
  State<MyWastePage> createState() => _MyWasteState();
}


class _MyWasteState extends State<MyWastePage> {
  var total = 0;
  final oCcy = NumberFormat("#,##0.00", "en_US");
  String? priceCount(String type,int weight) {
    if (type == "Plastic") {
      return oCcy.format(weight * 3000);
    } else if (type == "Metal") {
      return oCcy.format(weight * 4000);
    } else if (type == "Paper") {
      return oCcy.format(weight * 2000);
    } else if (type == "Glass") {
      return oCcy.format(weight * 1000);
    }
    return null;
  }

  int? iTotal(String type, int weight){

    if (type == "Plastic") {
      total += weight * 3000;
    } else if (type == "Metal") {
      total += weight * 4000;
    } else if (type == "Paper") {
      total += weight * 2000;
    } else if (type == "Glass") {
      total += weight * 1000;
    }
    return null;
  }

  String printTotal(){
    var fTotal = total;
    reset();
    return oCcy.format(fTotal);
  }

  void reset(){
    total = 0;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              'Waste Bank',
              style: TextStyle(
                  color: Colors.white
              )
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
            future: fetchMyWaste(context.read<CookieRequest>()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Waste Bank Empty :(",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  for(var i=0; i<snapshot.data!.length;i++){
                    if (snapshot.data![i].fields.isConfirm == true){
                      iTotal(snapshot.data![i].fields.wasteType, snapshot.data![i].fields.weight);
                    }
                  }
                  return Column(
                    children: <Widget>[
                      Column(
                        children: [
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(15), //apply padding to all four sides
                            child: Text("${snapshot.data![0].fields.username}'s Waste Bank",
                              style:
                              const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                          padding: const EdgeInsets.all(15), //apply padding to all four sides
                          child: Text("Total Income : Rp.${printTotal()}",
                            style:
                            const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          )
                        ],
                      ),
                      const Divider(height: 5.0,),
                      Expanded( //        <-- Use Expanded
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyWasteDetails(
                                        waste: snapshot.data![index])),
                              );
                            },

                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.wasteType}",
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(""),
                                      Text(
                                        "Rp.${priceCount(snapshot.data![index].fields.wasteType, snapshot.data![index].fields.weight)},00",
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child:Text(
                                        snapshot.data![index].fields.isConfirm? "Verified": "Not Verified",
                                        style: TextStyle(
                                            color: snapshot.data![index].fields.isConfirm? Colors.green: Colors.red
                                        ),
                                    )
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }
            }),
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddWastePage(),
                  )).then((_) => setState(() {}));
                },
                icon: const Icon(Icons.add_rounded,
                color: Colors.white,),
                label: const Text("       Add       ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: FloatingActionButton.extended(
                heroTag: "btn2",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminWastePage(),
                      )).then((_) => setState(() {}));
                },
                icon: const Icon(Icons.admin_panel_settings,
                  color: Colors.white,),
                  backgroundColor: Colors.lightBlueAccent,
                  label: const Text("Admin ?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}