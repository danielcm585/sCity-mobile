import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/utils/tender/create_new_company.dart';

class NewCompanyPage extends StatefulWidget {
  const NewCompanyPage({super.key});

  @override
  State<NewCompanyPage> createState() => _NewCompanyPageState();
}

class _NewCompanyPageState extends State<NewCompanyPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String ptName = '';
  String npwp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Company',
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() { name = value!; });
                },
                onSaved: (String? value) {
                  setState(() { name = value!; });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama perusahaan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'PT Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() { ptName = value!; });
                },
                onSaved: (String? value) {
                  setState(() { ptName = value!; });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama PT perusahaan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'NPWP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String? value) {
                  setState(() { npwp = value!; });
                },
                onSaved: (String? value) {
                  setState(() { npwp = value!; });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'NPWP tidak boleh kosong';
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
            createNewCompany(name, ptName, npwp);
          },
          child: const Text(
            'Save',
            style: TextStyle(
              fontSize: 16,
            )
          )
        )
      ),
    );
  }
}