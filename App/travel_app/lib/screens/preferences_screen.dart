import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:travel_app/algorithm/hotel_algo.dart';
import 'package:travel_app/utils/routes.dart';
import 'package:df/df.dart';
import 'dart:convert';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  List userHotelPreferences = [];
  List userCuisinePreferences = [];
  List userAttractionPreferences = [];
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
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.homeRoute);
            },
            //icon: Icon(Icons.home_filled),
            icon: Image.asset(
              "assets/images/Safar-logo-white.png",
            ),

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
      body: Container(
          child: Column(
        children: [
          Text(
            "Hotel preferences",
            style: TextStyle(
                color: Colors.amber,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            color: Colors.transparent,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                    hotelPref.length,
                    (index) => Item(
                          preferences: hotelPref[index],
                          onSelected: (bool value) {
                            if (value) {
                              userHotelPreferences.add(hotelPref[index].title);
                              print(userHotelPreferences);
                              print(userCuisinePreferences);
                              print(userAttractionPreferences);
                            } else {
                              userHotelPreferences
                                  .remove(hotelPref[index].title);
                              print(userHotelPreferences);
                              print(userCuisinePreferences);
                              print(userAttractionPreferences);
                            }

                            setState(() {});
                          },
                        ))
              ],
            ),
          ),
          Text(
            "Cuisine preferences",
            style: TextStyle(
                color: Colors.amber,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            color: Colors.transparent,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                    cuisinePref.length,
                    (index) => Item(
                          preferences: cuisinePref[index],
                          onSelected: (bool value) {
                            if (value) {
                              userCuisinePreferences
                                  .add(cuisinePref[index].title);
                              print(userHotelPreferences);
                              print(userCuisinePreferences);
                              print(userAttractionPreferences);
                            } else {
                              userCuisinePreferences
                                  .remove(cuisinePref[index].title);
                              print(userHotelPreferences);
                              print(userCuisinePreferences);
                              print(userAttractionPreferences);
                            }

                            setState(() {});
                          },
                        ))
              ],
            ),
          ),
          Text(
            "Attraction preferences",
            style: TextStyle(
                color: Colors.amber,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            color: Colors.transparent,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                    attractionsPref.length,
                    (index) => Item(
                          preferences: attractionsPref[index],
                          onSelected: (bool value) {
                            if (value) {
                              userAttractionPreferences
                                  .add(attractionsPref[index].title);
                              print(userHotelPreferences);
                              print(userCuisinePreferences);
                              print(userAttractionPreferences);
                            } else {
                              userAttractionPreferences
                                  .remove(attractionsPref[index].title);
                              print(userHotelPreferences);
                              print(userCuisinePreferences);
                              print(userAttractionPreferences);
                            }

                            setState(() {});
                          },
                        ))
              ],
            ),
          ),
          InkWell(
              onTap: () async {
                var data =
                    await rootBundle.loadString('assets/database/hotels.json');

                var decodedData = List<Map<String, dynamic>>.from(
                    json.decode(data)['hotels']);

                DataFrame df = await DataFrame.fromRows(decodedData);

                var hotelList = await hotel_algo(
                    df, "Jaipur", 700, 5, userHotelPreferences);

                print(df.subset(37, 38));

                Navigator.pushNamed(context, AppRoutes.hotelselectorRoute);
              },
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(Icons.navigate_next)))
        ],
      )),
    );
  }
}

class Item extends StatefulWidget {
  final Preferences preferences;
  final ValueChanged<bool> onSelected;
  const Item({
    Key? key,
    required this.preferences,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.onSelected(isSelected);
        });
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(
                milliseconds: 90,
              ),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  border: isSelected
                      ? Border.all(
                          width: 2,
                          color: Colors.white,
                        )
                      : null),
              child: Icon(
                widget.preferences.icons,
                size: 35,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.preferences.title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class Preferences {
  final String title;
  final IconData icons;

  Preferences(this.title, this.icons);
}

List<Preferences> hotelPref = [
  Preferences("Laundary", Icons.local_laundry_service),
  Preferences("Spa", Icons.spa),
  Preferences("Pool", Icons.pool),
  Preferences("Parking", Icons.local_parking),
  Preferences("Free Wifi", Icons.wifi),
  Preferences("Pet Friendly", Icons.pets),
  Preferences("Hot Tub", Icons.hot_tub),
  Preferences("Breakfast Included", Icons.breakfast_dining),
  Preferences("Gym", Icons.sports_gymnastics),
  Preferences("Restaurant", Icons.restaurant),
  Preferences("Airport Shuttle", Icons.airport_shuttle),
  Preferences("Babysitting", Icons.baby_changing_station),
  Preferences("Kitchen", Icons.kitchen),
  Preferences("Bar", Icons.wine_bar),
  Preferences("Outdoor Space", Icons.park),
  Preferences("Barbecue", Icons.outdoor_grill),
  Preferences("Fireplace", Icons.fireplace),
];

List<Preferences> cuisinePref = [
  Preferences("Italian ", Icons.local_pizza),
  Preferences("North Indian", Icons.food_bank),
  Preferences("South Indian", Icons.food_bank),
  Preferences("Chineese", Icons.food_bank),
  Preferences("Street Food", Icons.streetview),
  Preferences("Mexican", Icons.food_bank),
  Preferences("Finger Food", Icons.fastfood),
];

List<Preferences> attractionsPref = [
  Preferences("Tours and Day Trips", Icons.tour),
  Preferences("Adventure and Outdoor", Icons.sports),
  Preferences("History and Culture", Icons.history_edu),
  Preferences("Water Activities", Icons.beach_access),
  Preferences("Shows and Concerts", Icons.theater_comedy),
  Preferences("Attractions", Icons.attractions),
  Preferences("Food, Drink and Nightlife", Icons.nightlife),
  Preferences("Classes and Workshops", Icons.workspaces),
  Preferences("Transportation", Icons.emoji_transportation),
  Preferences("Air, Helicopter and Balloon Tours", Icons.airplane_ticket),
  Preferences("Holiday and Seasonal Tours", Icons.holiday_village),
  Preferences("Weddings and Honeymoons", Icons.event),
  Preferences("Shopping and fashion", Icons.shopping_bag),
  Preferences("Wildlife and nature", Icons.nature),
  Preferences("Cruises and Boat Tours", Icons.water)
];
