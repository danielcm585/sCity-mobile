import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/utils/healthcare/healthcareFetch.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/pages/healthcare/healthcareFormPage.dart';
import 'package:scity_mobile/pages/healthcare/healthcareDetailsPage.dart';
import 'package:intl/intl.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class HealthcarePage extends StatefulWidget {
  const HealthcarePage({Key? key}) : super(key: key);
  @override
  State<HealthcarePage> createState() => _HealthcarePageState();
}

class _HealthcarePageState extends State<HealthcarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthcare"),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: healthcareFetch(context),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].username),
                    subtitle: Text(DateFormat('dd-MM-yyyy')
                        .format(snapshot.data[index].appointmentDate)),
                    trailing: snapshot.data[index].appointmentStatus
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.cancel, color: Colors.red),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              healthcareDetailsPage(data: snapshot.data[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Column(
              children: const [
                Text("Empty Data ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const healthcareFormPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
