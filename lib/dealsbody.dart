import 'package:crepito99/dealItem.dart';
import 'package:flutter/material.dart';

class dealsbody extends StatefulWidget {
  @override
  _dealsbodyState createState() => _dealsbodyState();
}

class _dealsbodyState extends State<dealsbody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Card(
            child: deal_item(
              imagePath: 'assets/images/LoneRanger.png',
              dealsPrices: 450,
              name: 'Lone Ranger',
              detail:
                  '1 Zinger Burger, 1 Regular Fries, 1 Chocolate Mud Shake - 450 PKR',
            ),
          ),
          Card(
            child: deal_item(
                imagePath: 'assets/images/LoneRanger2.0.png',
                dealsPrices: 500,
                name: 'Lone Ranger 2.0',
                detail:
                    '1 Garlic Mayo Wrap, 1 Regular Fries, 1 Chocolate Mud Shake - 500 PKR'),
          ),
          Card(
            child: deal_item(
                imagePath: 'assets/images/Duo_Deal-2.png',
                dealsPrices: 700,
                name: 'Duo Deal',
                detail:
                    '1 Panini, 1 Garlic Mayo Wrap, 1 Regular Fries, 1 Chocolate Mud Shake - 700 PKR'),
          ),
          Card(
            child: deal_item(
                imagePath: 'assets/images/BurgerShurger.png',
                dealsPrices: 1000,
                name: 'Burger Shurger',
                detail: '5 Zinger Burger, 1.5L Soft Drink - 1000 PKR'),
          ),
          Card(
              child: deal_item(
                  imagePath: 'assets/images/ShutUpandTakeMyMoney.png',
                  dealsPrices: 1800,
                  name: 'Shut up and take my money',
                  detail:
                      '1 Garlic Mayo Wrap, 1 Honey Mustard Wrap, 1 Chipotle Wrap, 3 Regular Fries, 1 Chocolate Mud Shake, 1 Oreo Shake, 1 Kitkat Shake - 1800 PKR')),
          Card(
              child: deal_item(
                  imagePath: 'assets/images/WeHaveGotYouCovered.png',
                  dealsPrices: 2400,
                  name: 'We Have Got You Covered',
                  detail:
                      '5 Zinger Burgers. 5 Regular Fries. 3 Chocolate Mud Shakes. 2 Oreo IceCreams - 2400 PKR')),
          Card(
              child: deal_item(
                  imagePath: 'assets/images/WeHaveGotYouCovered-2.0.png',
                  dealsPrices: 2800,
                  name: 'We Have Got You Covered-2.0',
                  detail:
                      '2 Garlic Mayo Wraps. 2 Chipotle Wraps. 1 Honey Mustard Wrap. 5 Regular Fries. 3 Chocolate Mud Shakes. 2 Oreo IceCream Shakes - 2800 PKR')),
        ],
      ),
    );
  }
}
