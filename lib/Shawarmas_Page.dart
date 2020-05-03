import 'package:flutter/material.dart';
import 'main.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:crepito99/BottomNavigationBar.dart';
import 'menuItem.dart';

class Shawarmas extends StatefulWidget {
  @override
  _ShawarmasState createState() => _ShawarmasState();
}

class _ShawarmasState extends State<Shawarmas> {
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
          Title:"Shawarma",),
        bottomNavigationBar: bottombar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: menuItem(
                  itemName: 'Regular',
                  itemPrice: '160 PKR',
                  itemLP: '16LP',
                ),
              ),
              Card(
                  child: menuItem(
                      itemName: 'Creamy',
                      itemPrice: '230 PKR',
                      itemLP: '23LP')),
              Card(
                  child: menuItem(
                      itemName: 'Jalapeno',
                      itemPrice: '180 PKR',
                      itemLP: '18LP')),
              Card(
                  child: menuItem(
                      itemName: 'Honey Mustard',
                      itemPrice: '200 PKR',
                      itemLP: '20LP')),
              Card(
                  child: menuItem(
                      itemName: 'Chipotle',
                      itemPrice: '230 PKR',
                      itemLP: '23LP')),
              Card(
                  child: menuItem(
                      itemName: 'Platter',
                      itemPrice: '350 PKR',
                      itemLP: '35LP')),
            ],
          ),
        ),
      ),
    );
  }
}

