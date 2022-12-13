import 'package:flutter/material.dart';
import 'package:scity_mobile/models/tourism/place_model.dart';
import 'package:scity_mobile/pages/tourism/new_place_page.dart';
import 'package:scity_mobile/components/general/drawer.dart';

class PlaceListPage extends StatefulWidget {
  PlaceListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return PlaceListPageState();
  }
}

class PlaceListPageState extends State<PlaceListPage> {
  final List<Place> _dataList = [
    Place(
        description:
            'Ancol Taman Impian tempat rekreasi terbesar di Indonesia.',
        name: "Ancol",
        price: 12000,
        visitor: 0,
        image:
            'https://www.ancol.com/blog/wp-content/uploads/2022/02/tempat-wisata-di-jakarta-hits-murah.jpg'),
    Place(
        description:
            'Museum Fatahillah adalah museum sejarah Jakarta yang sangat populer.',
        name: "Museum Fatahillah",
        price: 5000,
        visitor: 0,
        image:
            'https://assets.promediateknologi.com/crop/0x0:0x0/750x500/photo/kliktimes/2022/07/p-20220721-140059-jpg-220722131258.jpg')
  ];

  void addVisitor(int indexPlace) {
    setState(() {
      _dataList[indexPlace].visitor++;
    });
  }

  void addPlace(Place place) {
    setState(() {
      _dataList.add(place);
    });
  }

  void handleAdd() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            NewPlacePage(refresh: () {}, addPlace: addPlace)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff05B068),
        title: Text('sCity',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          handleAdd();
        },
        child: Icon(Icons.add),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: _dataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Card(
                  child: Column(children: [
                    Container(
                        height: 200,
                        child: Image.network(
                          _dataList[index].image,
                          fit: BoxFit.cover,
                        )),
                    Text(
                      _dataList[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_dataList[index].description),
                    Text("Price: ${_dataList[index].price}"),
                    Text("Total visitor: ${_dataList[index].visitor}"),
                    ElevatedButton(
                        onPressed: () => addVisitor(index),
                        child: Text("+ buy ticket"))
                  ]),
                ),
              );
            }),
      ),
    );
  }
}
