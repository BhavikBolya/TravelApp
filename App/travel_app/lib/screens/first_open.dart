import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/utils/routes.dart';

class FirstOpen extends StatefulWidget {
  const FirstOpen({Key? key}) : super(key: key);

  @override
  State<FirstOpen> createState() => _FirstOpenState();
}

class _FirstOpenState extends State<FirstOpen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("First Open"),
        Container(
          height: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginRoute);
              },
              child: Text("To login screen"),
            ),
          ),
        )
      ],
    ));
  }
}
