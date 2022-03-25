import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/utils/routes.dart';

List locationImages = [
  'assets/images/jaipur.jpg',
  'assets/images/jaisalmer.jpg',
  'assets/images/jodhpur.jpg',
  'assets/images/udaipur.jpg'
];

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /* Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected Destination: $selectedLocation',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )), */
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            height: 300.0,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: carouselContent(context)),
          ),
        ),
      ],
    );
  }
}

carouselContent(context) {
  List<Widget> locationList = [];
  for (var i = 0; i < Locations.length; i++) {
    locationList.add(Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
      child: InkWell(
        onTap: () {
          selectedLocation = Locations[i];
          selectedLocationId = i;
          print(selectedLocation);
          //Navigator.pushNamed(context, AppRoutes.destinationRoute);
        },
        child: Stack(
          children: [
            Container(
                height: 500,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(locationImages[i]),
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.center)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      Locations[i],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                )),
            Container(
                height: 500,
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.85),
                        Colors.transparent
                      ]),
                  borderRadius: BorderRadius.circular(15),
                )),
          ],
        ),
      ),
    ));
  }
  return locationList;
}
