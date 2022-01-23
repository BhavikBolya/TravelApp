import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 350,
            width: double.infinity,
            color: Colors.blueGrey,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Jaipur',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(onPressed: null, child: const Text('Create Itenary'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

