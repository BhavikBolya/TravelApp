import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_app/firebase_options.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/destination_screen.dart';
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
        fontFamily: "Gilroy",
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => DestinationPage(),
        AppRoutes.homeRoute: (context) => HomeScreen()
      },
    );
  }
}
