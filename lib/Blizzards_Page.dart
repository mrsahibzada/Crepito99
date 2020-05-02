import 'package:crepito99/BottomNavigationBar.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:flutter/material.dart';

import 'menuItem.dart';

class blizzards extends StatefulWidget {
  @override
  _blizzardsState createState() => _blizzardsState();
}

class _blizzardsState extends State<blizzards> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xFFDB2C27),
        primaryColor: Colors.white,
//        focusColor: Colors.pink,
      ),
      home: Scaffold(
        appBar: Myappbar(
          cont: context,
          appBar: AppBar(),
          Title: 'Blizzards',
        ),
        bottomNavigationBar: bottombar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Card(
                  child: menuItem(
                      itemName: 'Oreo', itemPrice: '330 PKR', itemLP: '33LP')),
              Card(
                  child: menuItem(
                      itemName: 'Bounty',
                      itemPrice: '330 PKR',
                      itemLP: '33LP')),
              Card(
                  child: menuItem(
                      itemName: 'KitKat',
                      itemPrice: '330 PKR',
                      itemLP: '33LP')),
              Card(
                  child: menuItem(
                      itemName: 'Mars', itemPrice: '330 PKR', itemLP: '33LP')),
              Card(
                  child: menuItem(
                      itemName: 'Snickers',
                      itemPrice: '330 PKR',
                      itemLP: '33LP')),
              Card(
                  child: menuItem(
                      itemName: 'Twix', itemPrice: '330 PKR', itemLP: '33LP')),
            ],
          ),
        ),
      ),
    );
  }
}
