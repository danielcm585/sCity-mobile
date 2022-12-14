import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/utils/waste/fetch_admin_waste_json.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/pages/waste/waste_detail_page.dart';
import 'package:intl/intl.dart';
import 'package:scity_mobile/utils/waste/admin_check.dart';
import 'package:scity_mobile/utils/waste/delete_waste_admin.dart';
import 'package:scity_mobile/utils/waste/update_waste_admin.dart';


class AdminWastePage extends StatefulWidget {
  const AdminWastePage({Key? key}) : super(key: key);

  final String title = 'My Waste';

  @override
  State<AdminWastePage> createState() => _AdminWasteState();
}


class _AdminWasteState extends State<AdminWastePage> {

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

  @override
  Widget build(BuildContext context) {
    var admin = false;
    checkAdmin(context.read<CookieRequest>()).then((result) {
      admin = result;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Waste Bank (Admin)',
            style: TextStyle(
                color: Colors.white
            )
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
          future: fetchAdminWaste(context.read<CookieRequest>()),
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
              }
              if (admin == false) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          iconSize: 25,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                   const Padding(
                        padding: EdgeInsets.only(
                            left: 50.0, right: 20,top: 30,bottom: 30
                        ),
                        child:
                        Text(
                          "Sorry you are not admin :(",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                );
              }else {
                return Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: IconButton(
                              iconSize: 25,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 20,top: 30,bottom: 30
                            ),
                            child:
                            Text(
                              "${snapshot.data![0].fields.username}'s Admin",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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
                                      "${snapshot.data![index].fields.username}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(""),
                                    Text(
                                        "${snapshot.data![index].fields.wasteType}",
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
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
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child:Text(
                                          snapshot.data![index].fields.isConfirm? "Verified": "Not Verified",
                                          style: TextStyle(
                                              color: snapshot.data![index].fields.isConfirm? Colors.green: Colors.red
                                          ),
                                        )
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 50),
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: IconButton(
                                              iconSize: 27,
                                              onPressed: () {
                                                updateWaste(context, context.read<CookieRequest>() , snapshot.data![index].pk);
                                              },
                                              icon: Icon(snapshot.data![index].fields.isConfirm? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded  ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: IconButton(
                                            iconSize: 27,
                                            onPressed: () {
                                              deleteWaste(context, context.read<CookieRequest>() , snapshot.data![index].pk);
                                            },
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
    );
  }
}