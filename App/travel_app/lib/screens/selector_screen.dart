import 'package:flutter/material.dart';
import 'package:travel_app/screens/preferences_screen.dart';
import 'package:travel_app/utils/routes.dart';

int numHotels = hotelChoicesList.length;
var finalHotel = null;

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
    SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text("Please select a hotel for your trip: ",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              )),
        ),
      ),
    ),
  ];

  for (var i = 0; i < numHotels; i++) {
    var hotel_info = [
      df1.colRecords('hotel_name',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i]),
      df1.colRecords('hotel_rating',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i]),
      df1.colRecords('hotel_experience',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i]),
      df1.colRecords('amenities',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i]),
      df1.colRecords('address',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i]),
      df1.colRecords('city',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i]),
      df1.colRecords('country',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i]),
      df1.colRecords('location',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i]),
      df1.colRecords('hotel_price',
          offset: hotelChoicesList[i] - 1, limit: hotelChoicesList[i])
    ];
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
                        finalHotel = hotelChoicesList[i];
                        Navigator.pushNamed(context, AppRoutes.itineraryRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 15),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(Icons.navigate_next)),
                        ),
                      ))
                ],
                backgroundColor: Colors.black,
                title: Column(
                  children: [
                    Text(
                        hotel_info[0]
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', '') +
                            '\n',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(
                      'Address: ' +
                          hotel_info[4]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '') +
                          '\n\n'
                              'Amenities: ' +
                          hotel_info[3]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '')
                              .replaceAll("'", "") +
                          '\n\n'
                              'Experience: ' +
                          hotel_info[2]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '') +
                          '\n\n' +
                          'Rating: ' +
                          hotel_info[1]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '') +
                          '\n\n' +
                          'Price: \$ ' +
                          hotel_info[8]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '') +
                          ' per night',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Container(
            height: 165,
            width: MediaQuery.of(context).size.width - 40,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 0.0),
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
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 15.0),
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
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 15.0),
                      child: Text(
                        "Price: \$ " +
                            hotel_info[8]
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
