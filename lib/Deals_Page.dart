import 'package:crepito99/BottomNavigationBar.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:crepito99/dealsbody.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class Deals_Page extends StatefulWidget {
  @override
  _Deals_PageState createState() => _Deals_PageState();
}

class _Deals_PageState extends State<Deals_Page> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.black,
        primaryColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFFDB2C27)),
      ),
      home: Scaffold(
        appBar: Myappbar(
          appBar: AppBar(),
          Title: 'Deals',
        ),
        drawer: App_Drawer(),
        bottomNavigationBar: bottombar(),
        body: dealsbody(),
      ),
    );
  }
}
