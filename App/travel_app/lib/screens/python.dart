import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({ Key? key }) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {




  String hotelid = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Python'
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: (){}, child: const Text(
            'Press'
          )),

          SizedBox(
            height: 80,
          ),
          Text(
            '$hotelid'
          )
        ],
      ),
    );
  }
}