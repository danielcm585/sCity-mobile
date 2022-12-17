import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/models/healthcare/healthcareModels.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/utils/healthcare/healthcareFetch.dart';


class healthcareFormPage extends StatefulWidget {
  const healthcareFormPage({super.key});

  @override
  State<healthcareFormPage> createState() => _healthcareFormPageState();
}

class _healthcareFormPageState extends State<healthcareFormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username=TextEditingController();
  TextEditingController keluhan=TextEditingController();
  TextEditingController appointmentDate=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return int.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Healthcare Form'),
        ),
        drawer: const AppDrawer(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlueAccent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter your name",
                                labelText: "Nama Pasien",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              controller: username,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter keluhan",
                                labelText: "Keluhan",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              controller: keluhan,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter keluhan';
                                }
                                return null;
                              },
                            ),
                          ),
                          Center (
                            child: TextButton(
                              child: Text("Appointment date made at:"),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2099),
                                ).then((date) {
                                  setState(() {
                                  });
                                });
                              },
                            )
                          ),
                          Center(
                            child: Text("Appointment Date:${appointmentDate.toString().split(' ')[0]}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal
                            ),
                            )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "phone number",
                                  hintText: "Enter your phone number",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                controller: phoneNumber,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  } else if (!isNumeric(value)) {
                                    return 'Please enter a valid phone number';
                                  }
                                  phoneNumber = int.parse(value) as TextEditingController;
                                  return null;
                                },
                              ),
                            ),
                          TextButton(
                            child: const Text(
                              "Save",
                               style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                backgroundColor: Color.fromRGBO(0x2d,0xd4,0xbf,1),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final request = context.read<CookieRequest>();
                                healthcareFetch().addData(context,
                                 request,
                                username.text, 
                                keluhan.text, 
                                DateTime.parse(appointmentDate.text), 
                                int.parse(phoneNumber.text), 
                                );
                              };
                            },
                          ), 
                        ]
                      )
                    )
                  )
                )
              );
  }
}
