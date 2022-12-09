import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/utils/tender/create_new_registrant.dart';

class NewRegistrantPage extends StatefulWidget {
  const NewRegistrantPage({super.key});

  @override
  State<NewRegistrantPage> createState() => _NewRegistrantPageState();
}

class _NewRegistrantPageState extends State<NewRegistrantPage> {
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
            createNewRegistrant(context, request);
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