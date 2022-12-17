import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/models/tourism/place_model.dart';
import 'package:scity_mobile/models/tourism/tourism_model.dart';
import 'package:scity_mobile/pages/tourism/new_place_page.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/utils/tourism/fetch_tourism.dart';
import 'package:scity_mobile/utils/waste/fetch_admin_waste_json.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import '../../providers/cookie_request_provider.dart';
import '../../utils/waste/admin_check.dart';
import 'package:intl/intl.dart';

class PlaceListPage extends StatefulWidget {
  PlaceListPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return PlaceListPageState();
  }
}

class PlaceListPageState extends State<PlaceListPage> {
  List<TourismModel> listPlace = [];
  List<int> visitor = [];
  bool admin = false;
  var request;

  void addVisitor(int indexPlace) {
    FetchTourism()
        .addVisitor(context, request, listPlace[indexPlace].pk!.toString());
    setState(() {
      visitor[indexPlace]++;
    });
  }

  void handleAdd(var result) async{
    admin = await FetchTourism().checkAdmin(result);
    print(admin);
    if(admin==true){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NewPlacePage(refresh: () {})));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Maaf, anda bukan admin"),
      ));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    request = context.watch<CookieRequest>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff05B068),
          title: Text('sCity',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        floatingActionButton: Visibility(
          visible: request.loggedIn?true:false,
          child: FloatingActionButton(
            onPressed: () {
              handleAdd(request);
            },
            child: Icon(Icons.add,color: Colors.white,),
          ),
        ),
        drawer: AppDrawer(),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: listPlace.isEmpty
                ? FutureBuilder<List<TourismModel>>(
                    future: getDataPlace(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: listPlace.length,
                            itemBuilder: (BuildContext context, int index) {
                              visitor
                                  .add(snapshot.data![index].fields!.visitor!);
                              return Stack(
                                children: [
                                  Container(
                                    height: size.width > 800 ? 300 : 250,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: CachedNetworkImage(
                                      imageUrl: listPlace[index].fields!.image!,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            //image size fill
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: size.width > 800 ? 300 : 250,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Colors.transparent,
                                          Color(0xC7000000),
                                        ],
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 16, right: 16, bottom: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  width: 200,
                                                  child: Text(
                                                    listPlace[index]
                                                        .fields!
                                                        .name!,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                    maxLines: 2,
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                listPlace[index]
                                                    .fields!
                                                    .description!,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                                maxLines: 3,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Price : Rp. ${listPlace[index].fields!.price!}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total Visitor : ${visitor[index]}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                                maxLines: 2,
                                              ),
                                              Visibility(
                                                visible: request.loggedIn?true:false,
                                                child: TextButton(
                                                  onPressed: () =>
                                                      addVisitor(index),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    shape: const BeveledRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "Buy Ticket",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
                : ListView.builder(
                    itemCount: listPlace.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Container(
                            height: size.width > 800 ? 300 : 250,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 16),
                            child: CachedNetworkImage(
                              imageUrl: listPlace[index].fields!.image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    //image size fill
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: size.width > 800 ? 300 : 250,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Colors.transparent,
                                  Color(0xC7000000),
                                ],
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: 200,
                                          child: Text(
                                            listPlace[index].fields!.name!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                            maxLines: 2,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        listPlace[index].fields!.description!,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                        maxLines: 3,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Price : Rp. ${listPlace[index].fields!.price!}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Visitor : ${visitor[index]}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                        maxLines: 2,
                                      ),
                                      Visibility(
                                        visible: request.loggedIn?true:false,
                                        child: TextButton(
                                          onPressed: () => addVisitor(index),
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            shape: const BeveledRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Buy Ticket",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    })));
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
