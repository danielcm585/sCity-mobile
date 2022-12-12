import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/utils/agriculture/add_item.dart';

class NewAgriculture extends StatefulWidget {
  const NewAgriculture({
    super.key,
    required this.refresh,
  });
  final VoidCallback refresh;

  @override
  State<NewAgriculture> createState() => _NewAgricultureState();
}

class _NewAgricultureState extends State<NewAgriculture> {
  void refresh() {
    widget.refresh();
    setState(() {});
  }
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String contact = '';
  String description = '';
  String price = '';
  String number = '';
  String url = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Fish', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 14, right: 14),
        child: SingleChildScrollView(
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'New Fish',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fish Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      name = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      price = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      price = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Kontak tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      contact = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      contact = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama kontak tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      number = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      number = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor kontak tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Photo URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      url = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      url = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'URL foto tidak boleh kosong';
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
                      description = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
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
            addItem(context, request, refresh, name, description, contact, number, price, url);
            // final request = context.read<CookieRequest>();
            // createNewProject(context, request, refresh, title, description);
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
