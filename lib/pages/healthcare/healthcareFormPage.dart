import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';

class healthcareFormPage extends StatefulWidget {
  const healthcareFormPage({super.key});

  @override
  State<healthcareFormPage> createState() => _healthcareFormPageState();
}

class _healthcareFormPageState extends State<healthcareFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _keluhan = '';
  DateTime _appointmentDate = DateTime.now();
  int _phoneNumber = 0;
  bool _appointmentStatus = false;

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
                                hintText: "Enter your username",
                                labelText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _username = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _username = value!;
                                });
                              },
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
                              onChanged: (String? value) {
                                setState(() {
                                  _keluhan = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _keluhan = value!;
                                });
                              },
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
                              child: Text("choose date"),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2099),
                                ).then((date) {
                                  setState(() {
                                    _appointmentDate = date!;
                                  });
                                });
                              },
                            )
                          ),
                          Center(
                            child: Text("Appointment Date:${_appointmentDate.toString().split(' ')[0]}",
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
                                onSaved: (String? value) {
                                  setState(() {
                                    _phoneNumber = int.parse(value!);
                                  });
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  } else if (!isNumeric(value)) {
                                    return 'Please enter a valid phone number';
                                  }
                                  _phoneNumber = int.parse(value);
                                  return null;
                                },
                              ),),
                        ])))));
  }
}
