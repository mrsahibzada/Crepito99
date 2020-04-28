import 'package:flutter/material.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:crepito99/BottomNavigationBar.dart';
import 'menuItem.dart';


class Wraps extends StatefulWidget {
  @override
  _WrapsState createState() => _WrapsState();
}

class _WrapsState extends State<Wraps> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Myappbar(
          cont:context,
          appBar: AppBar(),
          Title: 'Wraps',
        ),
        bottomNavigationBar: bottombar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            Card(
              child: menuItem(
                  itemName: 'Garlic Mayo',
                  itemPrice: '300 PKR',
                  itemLP: '30LP'),
            ),
            Card(
              child: menuItem(
                  itemName: 'Chipotle', itemPrice: '350 PKR', itemLP: '35LP'),
            ),
            Card(
              child: menuItem(
                  itemName: 'Honey Mustard',
                  itemPrice: '380 PKR',
                  itemLP: '38LP'),
            ),
          ]),
        ),
      ),
    );
  }
}