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
          children: hotels(),
          // Positioned.fill(
          //   top: 170,
          //   child: Align(
          //     alignment: Alignment.topCenter,
          //     child: Padding(
          //       padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
          //       child: Container(
          //         height: MediaQuery.of(context).size.width / 2.5,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(25),
          //           color: Colors.white30,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
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

hotels() {
  List<Widget> hotelList = [SizedBox(height: 170)];
  for (var i = 0; i < numHotels; i++) {
    hotelList.add(Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 30.0),
        child: InkWell(
          onTap: () {
            AlertDialog(
              content: Text(
                "hotel $i",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          child: Container(
            height: 165,
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
