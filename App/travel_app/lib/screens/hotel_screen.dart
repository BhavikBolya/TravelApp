import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';

class HotelScreen extends StatefulWidget {
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("Hotel screen"),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.hotelselectorRoute);
              },
              child: Text("Back to hotel selector"),
            ),
          ),
        )
      ],
    ));
  }
}
