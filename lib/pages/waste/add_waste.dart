import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/models/waste/waste_model.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/utils/waste/create_new_waste.dart';

class AddWastePage extends StatefulWidget {
  const AddWastePage({Key? key}) : super(key: key);

  final String title = 'My Waste';

  @override
  _AddWasteState createState() => _AddWasteState();
}

class _AddWasteState extends State<AddWastePage> {

  final _formKey = GlobalKey<FormState>();
  double weight = 0;
  String wasteType = 'Plastic';
  List<String> wasteTypeList = ['Plastic', 'Metal', 'Paper', 'Glass'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Waste',
              style: TextStyle(
                  color: Colors.white
              )),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const AppDrawer(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
          child: Column(
            children: [
                  const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  SizedBox(
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
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 90.0, right: 20),
                      child:
                      Text(
                        "Price List",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "Plastic     : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: " Rp.3,000.00",
                                style: TextStyle(color: Colors.black87,fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "Metal        : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: " Rp.4,000.00",
                                style: TextStyle(color: Colors.black87,fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "Paper       : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: " Rp.2,000.00",
                                style: TextStyle(color: Colors.black87,fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "Glass        : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: " Rp.1,000.00",
                                style: TextStyle(color: Colors.black87,fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: const Icon(Icons.recycling),
                                            title: const Text(
                                              'Waste Type : ',
                                            ),
                                            trailing: DropdownButton(
                                              value: wasteType,
                                              icon: const Icon(Icons.keyboard_arrow_down),
                                              items: wasteTypeList.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  wasteType = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            leading: const Icon(Icons.scale),
                                            title: Row(
                                              children: [
                                                Text('Weight: ${weight.round()} Kg'),
                                              ],
                                            ),
                                            subtitle: Slider(
                                              value: weight,
                                              min: 0,
                                              max: 20,
                                              divisions: 20,
                                              label: weight.round().toString(),
                                              onChanged: (double value) {
                                                setState(() {
                                                  weight = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),
                                  TextButton(
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(0x10,0xb9,0x81,1))),
                                      onPressed: (){
                                        if (_formKey.currentState!.validate()){
                                          showDialog(context: context, builder: (context){
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              elevation: 15,
                                             child: ListView(
                                               padding: const EdgeInsets.only(top: 20, bottom: 20),
                                                 shrinkWrap: true,
                                               children: [
                                                 const Center(child: Text('Data Confirmation : ')),
                                                 const SizedBox(height: 20),
                                                 Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Column(
                                                     children: [
                                                       Text('Waste Type: $wasteType'),
                                                       Text('Weight: $weight'),
                                                     ],
                                                   ),
                                                 ),
                                                 TextButton(
                                                   onPressed: () {
                                                     Navigator.pop(context);
                                                   },
                                                   child: const Text('Back'),
                                                 ),
                                                 TextButton(
                                                     onPressed: (){
                                                       final request = context.read<CookieRequest>();
                                                       createNewWaste(context, request, wasteType, weight);
                                                 },
                                                     child: const Text('Add'))
                                               ],
                                             ),
                                            );
                                          });
                                        }
                                      },
                                      child: const Text("Add",
                                        style: TextStyle(color: Colors.white),))
                                ],
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}