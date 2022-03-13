import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/utils/routes.dart';
//import 'package:google_fonts/google_fonts.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/jaisalmer.jpg"),
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.centerLeft)),
              height: MediaQuery.of(context).size.height,
            ),
            Positioned.fill(
                bottom: 20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.width - 140,
                    width: MediaQuery.of(context).size.width - 25,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          )
                        ]),
                  ),
                )),
            Positioned.fill(
                top: 80,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "JAISALMER",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                )),
            Positioned.fill(
                top: 75,
                left: 12.5,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              )
                            ]),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.homeRoute);
                              },
                              icon: Icon(Icons.arrow_back_ios),
                              iconSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              height: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.preferencesRoute);
                    },
                    child: Text("To preferences page")),
              ),
            )
          ],
        )
      ]),
    );
  }
}
