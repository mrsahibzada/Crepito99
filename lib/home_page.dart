import 'package:crepito99/Beverages_Page.dart';
import 'package:crepito99/Blizzards_Page.dart';
import 'package:crepito99/Burgers_Page.dart';
import 'package:crepito99/IceCreamShakes_Page.dart';
import 'package:crepito99/Sandwiches_Page.dart';
import 'package:crepito99/Shawarmas_Page.dart';
import 'package:crepito99/Specials_Page.dart';
import 'package:crepito99/Wraps_Page.dart';
import 'package:crepito99/cart.dart';
import 'package:crepito99/dealsbody.dart';
import 'package:crepito99/login_screen.dart';
import 'package:crepito99/my_flutter_app_icons.dart';
import 'package:crepito99/my_orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Profile_page.dart';

class HomePage extends StatefulWidget {
  //Widget Class for main menu screen.
  int currentScreenIndex;
  HomePage(this.currentScreenIndex);
  @override
  _HomePageState createState() => _HomePageState(currentScreenIndex);
}

class _HomePageState extends State<HomePage> {
  int currentScreenIndex = 1;
  var screenTitles = ['Deals', 'Menu', 'Cart'];
  final screenObjects = [dealsbody(), GridViewList(), Cart()];
  _HomePageState(this.currentScreenIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenObjects[currentScreenIndex],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            //Icon button to go to profile
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Profile_page()));
            },
          )
        ],
        backgroundColor: Colors.white,
        title: Text(screenTitles[currentScreenIndex],
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Color(0xFFDB2C27)),
      ),
      drawer: new Drawer(
          // Drawer that contains additional options at left
          child: ListView(// 4 Options in Drawer
              children: <Widget>[
        CustomDrawerHeader(), // Displays drawer header information
        CustomListItem(
            Icons.flip_to_front,
            'My Orders',
            () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    My_orders()))), // Displays Option in drawer
        CustomListItem(Icons.star, 'Rate us', () => {}),
        CustomListItem(Icons.phone_android, 'Contact us\n03157008877',
            () => launch("tel://03157008877")),
        CustomListItem(
            Icons.face,
            'Sign Out',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()))),
      ])),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color(0xFFDB2C27),
          selectedItemColor: Colors.black,
          currentIndex: currentScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.heart_1),
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
          onTap: (index) {
            setState(() {
              currentScreenIndex =
                  index; //Updating screens on pressing bottomNavigationBar buttons
            });
          }),
    );
  }
}

class Item extends StatelessWidget {
  //Class to display Item Category
  final Function onTap;

  //src video
  //https://www.youtube.com/watch?v=m1XHj305zns
  String name;
  String imagePath;
  Item(this.name, this.imagePath, this.onTap); //constructor
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Inkwell widget to make each category clickable

      splashColor: Colors.black,
      onTap: onTap,
      child: Card(
          semanticContainer: false,
          elevation: 10.0,
          child: Column(children: <Widget>[
            new Image.asset(imagePath, fit: BoxFit.cover),
            new SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: new Text(name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300)),
            )
          ])),
    );
  }
}

class GridViewList extends StatefulWidget {
  // Class to display Item Categories in grid view.
  _GridExtended createState() => new _GridExtended();
}

class _GridExtended extends State<GridViewList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (170 / 250),
      children: <Widget>[
        Item(
            'Shawarma',
            'assets/images/Shawarma.png',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Shawarmas()))),
        Item(
            'Sandwiches',
            'assets/images/Sandwitch.png',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Sandwiches()))),
        Item(
            'Burger',
            'assets/images/Burger.png',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Burgers()))),
        Item(
            'Wraps',
            'assets/images/Wraps.png',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Wraps()))),
        Item(
            'Ice-cream Shakes',
            'assets/images/Ice-cream.png',
            () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => IceCreamShakes()))),
        Item(
            'Beverages',
            'assets/images/Beverages.png',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => beverages()))),
        Item(
            'Blizzards',
            'assets/images/Blizzards.png',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => blizzards()))),
        Item(
            'Specials',
            'assets/images/Mix.png',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Specials())))
      ],
    ));
  }
}

class CustomListItem extends StatelessWidget {
  //Class to display options in Drawer
  final IconData icon;
  final String text;
  final Function onTap;
  CustomListItem(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.pinkAccent,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 30.0 - 12.0, 0.0, .0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 28, 0),
                      child: Icon(icon, size: 22),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(text,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                )
              ]),
        ));
  }
}

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: User build
    return Container(
      color: Colors.red,
      child: DrawerHeader(
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    tooltip: 'back',
                    child: new Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red,
                      size: 14,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
