import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int budget = 100;
  DateTime initialDate = DateTime.now();
  DateTime finalDate = DateTime.now().add(Duration(days: 1));

  calc() {
    int numDays = finalDate.difference(initialDate).inDays;
    print(numDays);
    return numDays;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            toolbarHeight: 100,
            leadingWidth: 90,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0, 0),
              child: Image.asset("assets/images/Safar-logo-white.png"),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 15, 0),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.historyRoute);
                  },
                  icon: Icon(Icons.account_circle_outlined),
                  iconSize: 45,
                  color: Colors.white,
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            //backgroundColor: Colors.red,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.search,
                                color: Colors.amber,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Where are we headed",
                                style: TextStyle(color: Colors.amber),
                              ),
                            )
                          ]),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 25,
                        right: 0,
                        bottom: 0,
                        child: Text(
                          "Set hotel budget:",
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        right: 10,
                        child: SizedBox(
                          height: 40,
                          width: 350,
                          child: Slider.adaptive(
                            value: budget.toDouble(),
                            onChanged: (newBudget) {
                              setState(() => budget = newBudget.toInt());
                              //print(budget);
                            },
                            min: 100,
                            max: 1000,
                            divisions: 900,
                            label: "$budget",
                            inactiveColor: Colors.white30,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        bottom: 0,
                        left: 20,
                        right: 0,
                        child: Row(
                          children: [
                            Text(
                              "From: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 35,
                                width: 100,
                                child: FloatingActionButton.extended(
                                  elevation: 0,
                                  heroTag: "bttn1",
                                  backgroundColor: Colors.white30,
                                  label: Text(
                                    "${initialDate.day}/${initialDate.month}/${initialDate.year}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                    DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: initialDate,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (newDate == null) return;
                                    setState(() => initialDate = newDate);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "To: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 35,
                                width: 100,
                                child: FloatingActionButton.extended(
                                  elevation: 0,
                                  heroTag: "bttn2",
                                  backgroundColor: Colors.white30,
                                  label: Text(
                                    "${finalDate.day}/${finalDate.month}/${finalDate.year}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                    DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: finalDate,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (newDate == null) return;
                                    setState(() => finalDate = newDate);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Positioned(
                top: 210,
                left: 0,
                bottom: 0,
                right: 40,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        if (calc() == 0) {
                          return;
                        } else {
                          Navigator.pushNamed(
                              context, AppRoutes.preferencesRoute);
                        }
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 2),
                                    blurRadius: 20.0)
                              ]),
                          child: Icon(Icons.calendar_today))),
                ),
              ),
            ],
          )),
    );
  }
}
