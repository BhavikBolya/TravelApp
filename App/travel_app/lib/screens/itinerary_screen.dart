import 'package:flutter/material.dart';
import 'package:travel_app/screens/preferences_screen.dart';
import 'package:travel_app/screens/selector_screen.dart';
import 'package:travel_app/utils/routes.dart';

int numTabs = 5;

class ItineraryScreen extends StatefulWidget {
  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  @override
  Widget build(BuildContext context) {
    var hotel_info = [
      df1.colRecords('hotel_name', offset: finalHotel - 1, limit: finalHotel),
      df1.colRecords('hotel_rating', offset: finalHotel - 1, limit: finalHotel),
      df1.colRecords('hotel_price', offset: finalHotel - 1, limit: finalHotel)
    ];
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.destinationRoute);
              },
              child: Text(
                "Location",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          toolbarHeight: 100,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0, 0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.homeRoute);
              },
              //icon: Icon(Icons.home_filled),
              icon: Image.asset("assets/LOGO.png"),
              iconSize: 35,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.historyRoute);
                },
                icon: Icon(Icons.account_circle_outlined),
                iconSize: 35,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          //backgroundColor: Colors.red,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  top: 150,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.width - 210,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        //border: Border.all(width: 4.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        // image: DecorationImage(
                        //     image: AssetImage("assets/udaipur.jpg"),
                        //     fit: BoxFit.cover),
                      ),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 15.0, 0.0),
                              child: Text(
                                hotel_info[0]
                                    .toString()
                                    .replaceAll('[', '')
                                    .replaceAll(']', ''),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 15.0),
                              child: Text(
                                "Rating: " +
                                    hotel_info[1]
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 20.0, 15.0),
                              child: Text(
                                "Price: \$ " +
                                    hotel_info[2]
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', '') +
                                    " per night",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                      ]),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 375,
                  child: Align(
                    alignment: Alignment.center,
                    child: DefaultTabController(
                      length: numTabs,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width / 12,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.transparent,
                                child: TabBar(
                                  isScrollable: true,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.amber,
                                  ),
                                  tabs: tabMaker(),
                                ),
                              ),
                              Expanded(
                                child: TabBarView(children: tabContent()),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    color: Colors.transparent,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.homeRoute);
                                        },
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

tabMaker() {
  List<Widget> tabs = [];
  for (var i = 1; i <= numTabs; i++) {
    tabs.add(
      Container(
        width: 90,
        height: 15,
        child: Center(
          child: Text(
            "Day $i",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  ;
  return tabs;
}

tabContent() {
  List<Widget> content = [];

  for (var i = 0; i < numTabs; i++) {
    var attraction_info = [
      df2.colRecords('attraction_name',
          offset: attractionList[i] - 1, limit: attractionList[i]),
      df2.colRecords('attraction_rating',
          offset: attractionList[i] - 1, limit: attractionList[i]),
      df2.colRecords('attraction_price',
          offset: attractionList[i] - 1, limit: attractionList[i]),
    ];
    var restaurant1_info = [
      df3.colRecords('rest_name',
          offset: restaurantList[i] - 1, limit: restaurantList[i]),
    ];
    var restaurant2_info = [
      df3.colRecords('rest_name',
          offset: restaurantList[i + numTabs] - 1,
          limit: restaurantList[i + numTabs]),
    ];
    content.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Attraction: ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                attraction_info[0]
                                    .toString()
                                    .replaceAll('[', '')
                                    .replaceAll(']', ''),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        /* Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 15.0),
                              child: Text(
                                "Rating: " +
                                    attraction_info[1]
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 20.0, 15.0),
                              child: Text(
                                "Price: \$ " +
                                    attraction_info[2]
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', '') +
                                    " per night",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )) */
                      ]),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Lunch: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                restaurant1_info[0]
                                    .toString()
                                    .replaceAll('[', '')
                                    .replaceAll(']', ''),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        /* Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 15.0),
                              child: Text(
                                "Rating: " +
                                    attraction_info[1]
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 20.0, 15.0),
                              child: Text(
                                "Price: \$ " +
                                    attraction_info[2]
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', '') +
                                    " per night",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )) */
                      ]),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Dinner: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                restaurant2_info[0]
                                    .toString()
                                    .replaceAll('[', '')
                                    .replaceAll(']', ''),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        /* Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 15.0),
                              child: Text(
                                "Rating: " +
                                    attraction_info[1]
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 20.0, 15.0),
                              child: Text(
                                "Price: \$ " +
                                    attraction_info[2]
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', '') +
                                    " per night",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )) */
                      ]),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  return content;
}
