import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_app/firebase_options.dart';
import 'package:travel_app/screens/first_open.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/destination_screen.dart';
import 'package:travel_app/screens/hotel_screen.dart';
import 'package:travel_app/screens/itinerary_screen.dart';
import 'package:travel_app/screens/history.dart';
import 'package:travel_app/screens/login_screen.dart';
import 'package:travel_app/screens/preferences_screen.dart';
import 'package:travel_app/screens/register_screen.dart';
import 'package:travel_app/screens/selector_screen.dart';
import 'package:travel_app/utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        backgroundColor: Colors.black,
        fontFamily: "Gilroy",
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => FirstOpen(),
        AppRoutes.loginRoute: (context) => LoginScreen(),
        AppRoutes.homeRoute: (context) => HomeScreen(),
        AppRoutes.destinationRoute: (context) => DestinationScreen(),
        AppRoutes.preferencesRoute: (context) => PreferencesScreen(),
        AppRoutes.hotelselectorRoute: (context) => HotelSelector(),
        AppRoutes.hotelRoute: (context) => HotelScreen(),
        AppRoutes.itineraryRoute: (context) => ItineraryScreen(),
        AppRoutes.historyRoute: (context) => HistoryScreen(),
        AppRoutes.registerRoute: (context) => RegisterScreen(),
      },
    );
  }
}
