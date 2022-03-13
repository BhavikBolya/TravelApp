import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("History screen"),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.itineraryRoute);
              },
              child: Text("Show Itinerary"),
            ),
          ),
        )
      ],
    ));
  }
}
