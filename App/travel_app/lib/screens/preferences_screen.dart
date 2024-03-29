import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/algorithm/attraction_algo.dart';

import 'package:travel_app/algorithm/hotel_algo.dart';
import 'package:travel_app/algorithm/restaurant_algo.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/selector_screen.dart';
import 'package:travel_app/utils/routes.dart';
import 'package:df/df.dart';
import 'dart:convert';

List userHotelPreferences = [];
List userCuisinePreferences = [];
List userAttractionPreferences = [];
List hotelChoicesList = [];
List attractionList = [];
List restaurantList = [];
DataFrame df1 = DataFrame();
DataFrame df2 = DataFrame();
DataFrame df3 = DataFrame();

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: InkWell(
            onTap: () {
              //Navigator.pushNamed(context, AppRoutes.destinationRoute);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 44),
              child: Text(
                selectedLocation,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        leadingWidth: 100,
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
                showDialog(
                  barrierDismissible: true,
                  //barrierColor: Colors.black87,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    actions: [
                      InkWell(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, AppRoutes.loginRoute);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.logout,
                                  size: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 30, 30, 30),
                              child: Text(
                                "Sign Out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                    backgroundColor: Colors.black,
                  ),
                );
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
                var hotelsData =
                    await rootBundle.loadString('assets/database/hotels.json');
                var attractionsData = await rootBundle
                    .loadString('assets/database/attractions.json');
                var restaurantData = await rootBundle
                    .loadString('assets/database/restaurants.json');

                var decodedHotels = List<Map<String, dynamic>>.from(
                    json.decode(hotelsData)['hotels']);
                var decodedAttractions = List<Map<String, dynamic>>.from(
                    json.decode(attractionsData)['attractions']);
                var decodedrestaurants = List<Map<String, dynamic>>.from(
                    json.decode(restaurantData)['restaurants']);

                df1 = await DataFrame.fromRows(decodedHotels);
                df2 = await DataFrame.fromRows(decodedAttractions);
                df3 = await DataFrame.fromRows(decodedrestaurants);

                hotelChoicesList = await hotel_algo(df1, selectedLocation,
                    budget, numDays, userHotelPreferences);
                attractionList = await attraction_algo(
                    df2, selectedLocation, numDays, userAttractionPreferences);
                restaurantList = await restaurant_algo(
                    df3, selectedLocation, numDays, userCuisinePreferences);

                print(hotelChoicesList);
                print(attractionList);
                print(restaurantList);

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
