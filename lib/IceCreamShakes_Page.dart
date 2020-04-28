import 'package:flutter/material.dart';
import 'package:crepito99/MyAppBar.dart';
import 'BottomNavigationBar.dart';
import 'menuItem.dart';

class IceCreamShakes extends StatefulWidget {
  @override
  _IceCreamShakesState createState() => _IceCreamShakesState();
}

class _IceCreamShakesState extends State<IceCreamShakes> {
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
          Title: 'Ice-Cream Shakes',
        ),
        bottomNavigationBar: bottombar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: menuItem(
                  itemName: 'Coffee',
                  itemPrice: '250 PKR',
                  itemLP: '25LP',
                ),
              ),
              Card(
                  child: menuItem(
                      itemName: 'Chocolate Mud',
                      itemPrice: '250 PKR',
                      itemLP: '25LP')),
              Card(
                  child: menuItem(
                      itemName: 'Oreo',
                      itemPrice: '300 PKR',
                      itemLP: '30LP')),
              Card(
                  child: menuItem(
                      itemName: 'KitKat',
                      itemPrice: '380 PKR',
                      itemLP: '38LP')),
              Card(
                  child: menuItem(
                      itemName: 'Hot Fudge',
                      itemPrice: '420 PKR',
                      itemLP: '42LP')),
            ],
          ),
        ),
      ),
    );
  }
}

