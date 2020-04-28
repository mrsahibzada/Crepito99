import 'package:flutter/material.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:crepito99/BottomNavigationBar.dart';
import 'menuItem.dart';

class Burgers extends StatefulWidget {
  @override
  _BurgersState createState() => _BurgersState();
}

class _BurgersState extends State<Burgers> {
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
          Title: 'Burgers',
        ),
        bottomNavigationBar: bottombar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: menuItem(
                  itemName: 'Shami',
                  itemPrice: '160 PKR',
                  itemLP: '16LP',
                ),
              ),
              Card(
                  child: menuItem(
                      itemName: 'Zinger',
                      itemPrice: '250 PKR',
                      itemLP: '25LP')),
              Card(
                  child: menuItem(
                      itemName: 'Jalapeno Zinger',
                      itemPrice: '300 PKR',
                      itemLP: '30LP')),
              Card(
                  child: menuItem(
                      itemName: 'Swiss',
                      itemPrice: '280 PKR',
                      itemLP: '28LP')),
              Card(
                  child: menuItem(
                      itemName: 'Double Swiss',
                      itemPrice: '350 PKR',
                      itemLP: '35LP')),
              Card(
                  child: menuItem(
                      itemName: 'Chicken Steak',
                      itemPrice: '350 PKR',
                      itemLP: '35LP')),
            ],
          ),
        ),
      ),
    );
  }
}

