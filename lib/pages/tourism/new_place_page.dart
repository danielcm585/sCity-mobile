import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/models/tourism/place_model.dart';
import 'package:scity_mobile/utils/tourism/create_new_place.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';

class NewPlacePage extends StatefulWidget {
  const NewPlacePage({
    super.key,
    required this.refresh,
    required this.addPlace,
  });

  final VoidCallback refresh;
  final void Function(Place) addPlace;

  @override
  State<NewPlacePage> createState() => _NewPlacePageState();
}

class _NewPlacePageState extends State<NewPlacePage> {
  void refresh() {
    widget.refresh();
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  Place _newPlace =
      Place(name: '', description: '', price: 0, image: '', visitor: 0);

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
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Link Image',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _newPlace.image = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _newPlace.image = value!;
                      });
                    },
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
                    onChanged: (String? value) {
                      setState(() {
                        _newPlace.name = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _newPlace.name = value!;
                      });
                    },
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
                    onChanged: (String? value) {
                      setState(() {
                        _newPlace.description = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _newPlace.description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _newPlace.price = int.parse(value!);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _newPlace.price = int.parse(value!);
                      });
                    },
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
                createNewPlace(context, request, refresh, _newPlace);
                widget.addPlace(_newPlace);
                Navigator.of(context).pop();
              },
              child: const Text('Save',
                  style: TextStyle(
                    fontSize: 16,
                  )))),
    );
  }
}
