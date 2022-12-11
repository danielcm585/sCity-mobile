import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/models/waste/waste_model.dart';

class MyWasteDetails extends StatefulWidget {
  const MyWasteDetails({super.key, required this.waste});

  final MyWaste waste;

  @override
  State<MyWasteDetails> createState() => _MyWasteDetailsState();
}

class _MyWasteDetailsState extends State<MyWasteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail',
              style: TextStyle(
              color: Colors.white
          )
        ),
      iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const AppDrawer(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
          child: Column(
            children: [
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
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 120.0, right: 20),
                      child: 
                        Text(
                          widget.waste.fields.wasteType,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: "Username  : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: " ${widget.waste.fields.username}",
                                style: const TextStyle(color: Colors.black87,fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: "Weight        : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: " ${widget.waste.fields.weight}",
                                style: const TextStyle(color: Colors.black87,fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: "Status         : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: " ${widget.waste.fields.isConfirm == true? 'Verified' :'Not Verified'}",
                                style: const TextStyle(color: Colors.black87,fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: "Date             : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: " ${widget.waste.fields.date}".substring(0,11),
                                style: const TextStyle(color: Colors.black87,fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}