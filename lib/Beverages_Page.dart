import 'package:crepito99/BottomNavigationBar.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:flutter/material.dart';

import 'menuItem.dart';

class beverages extends StatefulWidget {
  @override
  _beveragesState createState() => _beveragesState();
}

class _beveragesState extends State<beverages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color(0xFFDB2C27)),
        primaryColor: Colors.white,
        accentColor: Color(0xFFDB2C27),
      ),
      home: Scaffold(
        appBar: Myappbar(
          cont: context,
          appBar: AppBar(),
          Title: 'Beverages',
        ),
        bottomNavigationBar: bottombar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: menuItem(
                  itemName: 'Tea',
                  itemPrice: '100 PKR',
                  itemLP: '10LP',
                ),
              ),
              Card(
                  child: menuItem(
                      itemName: 'Coffee',
                      itemPrice: '140 PKR',
                      itemLP: '14LP')),
              Card(
                  child: menuItem(
                      itemName: 'Hot Chocolate',
                      itemPrice: '180 PKR',
                      itemLP: '18LP')),
              Card(
                  child: menuItem(
                      itemName: 'Coffee + Brownie',
                      itemPrice: '220 PKR',
                      itemLP: '22LP')),
              Card(
                  child: menuItem(
                      itemName: 'Water Bottle',
                      itemPrice: '45 PKR',
                      itemLP: '5LP')),
              Card(
                  child: menuItem(
                      itemName: 'Soft Drink Can',
                      itemPrice: '50 PKR',
                      itemLP: '5LP')),
            ],
          ),
        ),
      ),
    );
  }
}
