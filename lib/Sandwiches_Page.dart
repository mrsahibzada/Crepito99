import 'package:flutter/material.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:crepito99/BottomNavigationBar.dart';
import 'menuItem.dart';



class Sandwiches extends StatefulWidget {
  @override
  _SandwichesState createState() => _SandwichesState();
}

class _SandwichesState extends State<Sandwiches> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.red),
        primaryColor: Colors.white,
        accentColor: Colors.red,
      ),
      home: Scaffold(
        appBar: Myappbar(
          cont:context,
          appBar: AppBar(),
          Title: 'Sandwiches',
        ),
        bottomNavigationBar: bottombar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            Card(
              child: menuItem(
                  itemName: 'Chicken',
                  itemPrice: '280 PKR',
                  itemLP: '28LP'),
            ),
            Card(
              child: menuItem(
                  itemName: 'Club', itemPrice: '360 PKR', itemLP: '36LP'),
            ),
            Card(
              child: menuItem(
                  itemName: 'Panini',
                  itemPrice: '350 PKR',
                  itemLP: '35LP'),
            ),
          ]),
        ),
      ),
    );
  }
}