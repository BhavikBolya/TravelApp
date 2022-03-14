import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';

int numTabs = 6;

class ItineraryScreen extends StatefulWidget {
  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 100,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
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
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 0.0),
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
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  top: 150,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.width - 210,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        //border: Border.all(width: 4.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/udaipur.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 375,
                  child: Align(
                    alignment: Alignment.center,
                    child: DefaultTabController(
                      length: numTabs,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 0.0),
                          child: Container(
                            height: MediaQuery.of(context).size.width / 10,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: TabBar(
                              isScrollable: true,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.amber,
                              ),
                              tabs: tabMaker(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                /* Container(
                  height: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.homeRoute);
                      },
                      child: Text("save"),
                    ),
                  ),
                ) */
              ],
            ),
          ],
        ));
  }
}

tabMaker() {
  List<Widget> tabs = [];
  for (var i = 1; i <= numTabs; i++) {
    tabs.add(
      Container(
        width: 90,
        height: 15,
        child: Center(
          child: Text(
            "Day $i",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  ;
  return tabs;
}
