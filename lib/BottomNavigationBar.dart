import 'package:crepito99/Deals_Page.dart';
import 'package:crepito99/cart.dart';
import 'package:crepito99/styling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crepito99/my_flutter_app_icons.dart';
import 'package:crepito99/home_page.dart';

var currentScreenIndex = 1;

class bottombar extends StatefulWidget {
  @override
  _bottombar_PageState createState() => _bottombar_PageState();
}

class _bottombar_PageState extends State<bottombar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedItemColor: Color(0xFFDB2C27),
        selectedItemColor: Colors.black,
        currentIndex: currentScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon:Icon(MyFlutterApp.heart_1),
            title: Text('Deals'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Menu'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            backgroundColor: Colors.black,
          )
        ],
        onTap: (index){
          setState(() {
            currentScreenIndex=index;

            Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => HomePage(index)));//Updating screens on pressing bottomNavigationBar buttons
          });}
    );
  }
}
