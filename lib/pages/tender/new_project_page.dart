import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/utils/tender/create_new_project.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';

class NewProjectPage extends StatefulWidget {
  const NewProjectPage({super.key});

  @override
  State<NewProjectPage> createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Project',
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
                    'Projects',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() { title = value!; });
                },
                onSaved: (String? value) {
                  setState(() { title = value!; });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                onChanged: (String? value) {
                  setState(() { description = value!; });
                },
                onSaved: (String? value) {
                  setState(() { description = value!; });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
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
            createNewProject(context, request, title, description);
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