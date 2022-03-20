import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';

int numHotels = 3;

class HotelSelector extends StatefulWidget {
  @override
  _HotelSelectorState createState() => _HotelSelectorState();
}

class _HotelSelectorState extends State<HotelSelector> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: hotels(context),
          /* Container(
                    height: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.itineraryRoute);
                        },
                        child: Text("To itinerary page"),
                      ),
                    ),
                  ), */
        ),
      ),
    );
  }
}

hotels(context) {
  List<Widget> hotelList = [
    SizedBox(height: 170),
  ];
  for (var i = 1; i <= numHotels; i++) {
    hotelList.add(Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 15.0),
        child: InkWell(
          onTap: () {
            showDialog(
              barrierDismissible: true,
              //barrierColor: Colors.black87,
              context: context,
              builder: (BuildContext context) => AlertDialog(
                actions: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.itineraryRoute);
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(Icons.navigate_next)))
                ],
                backgroundColor: Colors.black,
                title: Text(
                  "Hotel $i",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
          child: Container(
            height: 165,
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 0.0),
                      child: Text(
                        "Hotel $i",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white30,
            ),
          ),
        ),
      ),
    ));
  }
  return hotelList;
}
