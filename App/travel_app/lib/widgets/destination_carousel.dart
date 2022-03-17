import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Popular Destinations', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
                GestureDetector(
                  onTap: () => print('See All'),
                  child: Text('See All', style: TextStyle(fontSize: 20.0, color: Colors.amber, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
                ),],)
        ),
        Container(height: 300.0,
          color: Colors.amber,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 210.0,
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      width: 210,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Udaipur', style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
