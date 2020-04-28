import 'package:flutter/material.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:crepito99/BottomNavigationBar.dart';
import 'menuItem.dart';

class Specials extends StatefulWidget {
  @override
  _SpecialsState createState() => _SpecialsState();
}

class _SpecialsState extends State<Specials> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Myappbar(
          cont:context,
          appBar: AppBar(),
          Title: 'Specials',
        ),
        bottomNavigationBar: bottombar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: menuItem(itemName: 'Brownie', itemPrice: '160 PKR', itemLP: '16LP'),
              ),
              Card(
                child: menuItem(itemName: 'Cookie', itemPrice: '230 PKR', itemLP: '23LP'),
              ),
              Card(
                child: menuItem(itemName: 'Zinger Paratha', itemPrice: '180 PKR', itemLP: '18LP'),
              ),
              Card(
                child: menuItem(itemName: 'Ice-Cream', itemPrice: '200 PKR', itemLP: '20LP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}