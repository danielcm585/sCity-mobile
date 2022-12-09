import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/models/tender/company_model.dart';
import 'package:scity_mobile/models/tender/project_model.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/utils/tender/create_new_registrant.dart';
import 'package:scity_mobile/utils/tender/fetch_my_companies.dart';

class NewRegistrantPage extends StatefulWidget {
  const NewRegistrantPage({super.key,
    required this.project,
  });

  final Project project;

  @override
  State<NewRegistrantPage> createState() => _NewRegistrantPageState();
}

class _NewRegistrantPageState extends State<NewRegistrantPage> {
  final _formKey = GlobalKey<FormState>();

  int? companyId;
  int? offeredPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Registrant',
          style: TextStyle(
            color: Colors.white
          )
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 14, right: 14),
        child: Form(
          key: _formKey,
          child: Column(
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
                  const Text(
                    'New Company',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              FutureBuilder(
                future: fetchMyCompanies(context.read<CookieRequest>()),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  }
                  return DropdownButtonFormField(
                    value: companyId,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    decoration: InputDecoration(
                      labelText: 'Company',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: snapshot.data!.map<DropdownMenuItem<int>>((Company data) {
                      return DropdownMenuItem(
                        value: data.id,
                        child: Text(data.companyName),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      setState(() { companyId = value!; });
                    },
                  );
                }
              ),
              const SizedBox(height: 14),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Offered Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String? value) {
                  setState(() { offeredPrice = int.parse(value!); });
                },
                onSaved: (String? value) {
                  setState(() { offeredPrice = int.parse(value!); });
                },
                validator: (String? value) {
                  if (value == null || int.parse(value) <= 0) {
                    return "Harga penawaran tidak valid";
                  }
                  return null;
                },
              ),
            ],
          )
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
            final request = context.read<CookieRequest>();
            createNewRegistrant(context, request, widget.project.id, companyId, offeredPrice);
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