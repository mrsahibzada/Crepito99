import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final Function onTap;

  //Class to display Item Category
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
      child: Container(
          height: 100,
          width: 100,
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10.0,
              child: Column(children: <Widget>[
                new Image.asset(imagePath,
                    height: 193, width: 175, fit: BoxFit.cover),
                new SizedBox(height: 1.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
                  child: new Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal)),
                )
              ]))),
    );
  }
}
