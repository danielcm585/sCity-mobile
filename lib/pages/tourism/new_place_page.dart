import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/models/tourism/place_model.dart';
import 'package:scity_mobile/utils/tourism/create_new_place.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/utils/tourism/fetch_tourism.dart';

class NewPlacePage extends StatefulWidget {
  const NewPlacePage({
    super.key,
    required this.refresh,
  });

  final VoidCallback refresh;
  @override
  State<NewPlacePage> createState() => _NewPlacePageState();
}

class _NewPlacePageState extends State<NewPlacePage> {
  void refresh() {
    widget.refresh();
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController name=TextEditingController();
  TextEditingController desc=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController image=TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Place', style: TextStyle(color: Colors.white)),
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
                        'New Place',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Link Image',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: image,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Link Image tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: name,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
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
                    controller: desc,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: price,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ],
              ))),
      bottomSheet: Container(
          margin: const EdgeInsets.only(bottom: 30, left: 14, right: 14),
          width: double.maxFinite,
          height: 50,
          child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(0x10, 0xb9, 0x81, 1)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
              onPressed: () {
              final request = context.read<CookieRequest>();
               FetchTourism().addPlace(context, request, name.text, desc.text, price.text, image.text);
              },
              child: const Text('Save',
                  style: TextStyle(
                    fontSize: 16,
                  )))),
    );
  }
}
