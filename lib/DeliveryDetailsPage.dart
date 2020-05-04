import 'dart:ui';

import 'package:flutter/material.dart';
import 'MyAppBar.dart';
import 'BottomNavigationBar.dart';

class DeliveryDetailsPage extends StatefulWidget {
  @override
  _DeliveryDetailsPageState createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  String location;
  String note;
  String address;

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.red),
//        primaryColor: Colors.black87,
        accentColor: Colors.red,
      ),
      home: Scaffold(
        appBar: Myappbar(
          cont: context,
          appBar: AppBar(),
          Title: "Cart",
        ),
        bottomNavigationBar: bottombar(),
       body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Delivery Details',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                decoration: kBoxDecorationStyle,
                height: 80.0,
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    address = value;
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 14.0,0.0,0.0),
                      suffixIcon: IconButton(
                          icon: Icon(
                          Icons.edit_location,
                          color: Colors.black87,
                        ),
                        onPressed: (){

                        },
                      ),
                      hintText: 'Set Location',
                      hintStyle: kHintTextStyle),
                ),
              ),
              SizedBox(
                height: 21.0,
              ),
              Container(
                alignment: Alignment.topLeft,
                decoration: kBoxDecorationStyle,
                height: 122.0,
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    location = value;
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 14.0,0.0,0.0),
                      hintText: 'House/Floor No:',
                      hintStyle: kHintTextStyle),
                ),
              ),
              SizedBox(
                height: 21.0,
              ),
              Container(
                alignment: Alignment.topLeft,
                decoration: kBoxDecorationStyle,
                height: 150.0,
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    note = value;
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 14.0,0.0,0.0),
                      hintText: 'Note to Crepito',
                      hintStyle: kHintTextStyle),
                ),
              ),
              SizedBox(
                height: 38.0,
              ),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  highlightElevation: 20.0,
                  onPressed: (){

                  },
                  color: Colors.white,
                  child: Text(
                    'Save and Continue',
                    style: TextStyle(
                      color: Color(0xFFDB2C27),
                    ),

                  ),

                ),
              )
            ]),
      ),
    );
  }
}

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final kHintTextStyle = TextStyle(
  color: Colors.black54,
  fontFamily: 'OpenSans',
);
