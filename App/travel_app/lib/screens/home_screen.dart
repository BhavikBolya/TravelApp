import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';

import '../widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/*class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("home screen"),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.historyRoute);
              },
              child: Text("To history screen"),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.destinationRoute);
              },
              child: Text("To destination screen"),
            ),
          ),
        )
      ],
    ));
  }
}*/

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 220.0, right: 20.0),
                child: Text('Hello, User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              DestinationCarousel(),
            ],
          ),
        ));
  }
}
