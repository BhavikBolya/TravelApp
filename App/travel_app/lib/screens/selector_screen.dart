import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';

class HotelSelector extends StatefulWidget {
  @override
  _HotelSelectorState createState() => _HotelSelectorState();
}

class _HotelSelectorState extends State<HotelSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("Hotel selector"),
        Container(
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
        ),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.hotelRoute);
              },
              child: Text("To Hotel Screen"),
            ),
          ),
        )
      ],
    ));
  }
}
