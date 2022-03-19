import 'package:flutter/material.dart';
import 'package:travel_app/algorithm/hotel_algo.dart';
import 'package:travel_app/utils/routes.dart';

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
            height: 130,
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
            height: 130,
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
            height: 130,
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
          ElevatedButton(
              onPressed: () async {
                print(await hotel_algo("Jaipur", 500, 3, userHotelPreferences));
              },
              child: Icon(Icons.next_plan))
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
  Preferences("Fastfood", Icons.fastfood),
  Preferences("Chineese", Icons.food_bank),
];

List<Preferences> attractionsPref = [
  Preferences("Tours", Icons.tour),
  Preferences("Adventure", Icons.sports),
  Preferences("History", Icons.attractions),
];
