import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crepito99/BottomNavigationBar.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:flutter/material.dart';

import 'menuItem.dart';

class Burgers extends StatefulWidget {
  @override
  _BurgersState createState() => _BurgersState();
}

class _BurgersState extends State<Burgers> {
  Firestore _firestore = Firestore.instance;
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
          cont: context,
          appBar: AppBar(),
          Title: 'Burgers',
        ),
        bottomNavigationBar: bottombar(),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Burgers').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  }
                  final data = snapshot.data.documents;
                  List<CardViewer> cardWidgets = [];
                  for (var items in data) {
                    print(items.data['name']);
                    final name = items.data['name'];
                    final price = items.data['price'].toString();
                    final loyaltyPoints =
                        items.data['loyaltyPoints'].toString();
                    final card = CardViewer(
                      name: name,
                      price: price,
                      loyaltyPoint: loyaltyPoints,
                    );
                    cardWidgets.add(card);
                  }
                  return Expanded(
                    child: ListView(
                      children: cardWidgets,
                    ),
                  );
                },
              ),
            ])),
      ),
    );
  }
}

class CardViewer extends StatelessWidget {
  @override
  final String name;
  final String price;
  final String loyaltyPoint;
  CardViewer({this.name, this.price, this.loyaltyPoint});
  Widget build(BuildContext context) {
    return Card(
        child: menuItem(
            itemName: name,
            itemPrice: price + ' PKR',
            itemLP: loyaltyPoint + ' LP'));
  }
}
