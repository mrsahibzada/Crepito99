import 'package:crepito99/Beverages_Page.dart';
import 'package:crepito99/Blizzards_Page.dart';
import 'package:crepito99/BottomNavigationBar.dart';
import 'package:crepito99/Burgers_Page.dart';
import 'package:crepito99/IceCreamShakes_Page.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:crepito99/Sandwiches_Page.dart';
import 'package:crepito99/Shawarmas_Page.dart';
import 'package:crepito99/Specials_Page.dart';
import 'package:crepito99/Wraps_Page.dart';
import 'package:crepito99/drawer.dart';
import 'package:crepito99/item.dart';
import 'package:flutter/material.dart';

class GridViewList extends StatefulWidget {
  // Class to display Item Categories in grid view.
  _GridExtended createState() => new _GridExtended();
}

class _GridExtended extends State<GridViewList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: Myappbar(
          appBar: AppBar(),
          Title: 'Menu',
        ),
        drawer: App_Drawer(),
        bottomNavigationBar: bottombar(),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (170 / 263),
          children: <Widget>[
            Item(
                'Shawarma',
                'assets/images/Shawarma.png',
                () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Shawarmas()))),
            Item(
                'Sandwitches',
                'assets/images/Sandwitch.png',
                () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Sandwiches()))),
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
                () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => beverages()))),
            Item(
                'Blizzards',
                'assets/images/Blizzards.png',
                () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => blizzards()))),
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
      color: Color(0xFFDB2C27),
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
                      color: Color(0xFFDB2C27),
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
