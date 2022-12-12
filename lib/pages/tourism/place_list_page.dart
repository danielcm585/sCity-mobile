import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scity_mobile/models/tourism/place_model.dart';
import 'package:scity_mobile/models/tourism/tourism_model.dart';
import 'package:scity_mobile/pages/tourism/new_place_page.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/utils/tourism/fetch_tourism.dart';

class PlaceListPage extends StatefulWidget {
  PlaceListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return PlaceListPageState();
  }
}

class PlaceListPageState extends State<PlaceListPage> {
  List<TourismModel> listPlace = [];
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
        description: 'Museum Sejarah Jakarta dikenal dengan Museum Fatahillah.',
        name: "Museum Fatahillah",
        price: 5000,
        visitor: 0,
        image:
            'https://lonelyplanetimages.imgix.net/a/g/hi/t/d884051dce68d8e1dec12bf7c490f8eb-museum-nasional.jpg'),
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
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
          child: FutureBuilder<List<TourismModel>>(
              future: getDataPlace(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: listPlace.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Card(
                            child: Column(children: [
                              Container(
                                  height: 200,
                                  child: Image.network(
                                    listPlace[index].fields!.image!,
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                listPlace[index].fields!.name!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(listPlace[index].fields!.description!),
                              Text("Price: ${listPlace[index].fields!.price!}"),
                              Text(
                                  "Total visitor: ${listPlace[index].fields!.visitor!}"),
                              ElevatedButton(
                                  onPressed: () => addVisitor(index),
                                  child: Text("+ buy ticket"))
                            ]),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }

  Future<List<TourismModel>> getDataPlace() async {
    var jsonMap = await FetchTourism().getDataPlace();
    for (int i = 0; i < jsonMap.length; i++) {
      TourismModel tourismModel = TourismModel.fromJson(jsonMap[i]);
      listPlace.add(tourismModel);
    }

    return listPlace;
  }
}
