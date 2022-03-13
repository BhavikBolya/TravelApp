import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';

class ItineraryScreen extends StatefulWidget {
  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("Itinerary screen"),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.homeRoute);
              },
              child: Text("save"),
            ),
          ),
        )
      ],
    ));
  }
}
