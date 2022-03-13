import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("Preferences screen"),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.hotelselectorRoute);
              },
              child: Text("To hotel selector"),
            ),
          ),
        )
      ],
    ));
  }
}
