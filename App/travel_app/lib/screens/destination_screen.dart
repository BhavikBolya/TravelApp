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
      appBar: AppBar(
        leadingWidth: 70,
        title: Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.destinationRoute);
            },
            child: Text(
              "LOCATION",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
        toolbarHeight: 100,
        //automaticallyImplyLeading: false,
        leading: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
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
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.homeRoute);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.historyRoute);
              },
              icon: Icon(Icons.account_circle_outlined),
              iconSize: 35,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        //backgroundColor: Colors.red,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
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
                        color: Colors.white30,
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
              bottom: 50,
              right: 30,
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: (() {
                    Navigator.pushNamed(context, AppRoutes.preferencesRoute);
                  }),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
