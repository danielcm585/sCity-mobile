import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scity_mobile/models/healthcare/healthcareModels.dart';
import 'package:scity_mobile/pages/healthcare/healthcareMainPage.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/pages/home/home_page.dart';

class healthcareDetailsPage extends StatelessWidget {
  final healthcareModels data;
  const healthcareDetailsPage({super.key, required this.data});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Healthcare',
          style: TextStyle(
            color: Colors.white
          )
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: AppDrawer(),
      body: Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(data.username,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Row(
              children: [
                Text("Keluhan: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(data.keluhan,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],),
            Row(
              children: [
                Text("Appointment Status: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                if (data.appointmentStatus)
                Text("verified",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.green)),
                if (!data.appointmentStatus)
                Text("not verified",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.red)),
              ],),
            Row(
              children: [
                Text("Appointment Date: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(data.appointmentDate.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ],),
            Row(children: [
                Text("Appointment Date: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(data.appointmentDate.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ],),
          ],
      ),
    ),
    );
  }
}
