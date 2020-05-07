import 'package:crepito99/styling.dart';
import 'package:flutter/material.dart';
import 'package:crepito99/my_orders.dart';

class App_Drawer extends StatelessWidget {
  const App_Drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        // Drawer that contains additional options at left
        child: ListView(// 4 Options in Drawer
            children: <Widget>[
      CustomDrawerHeader(), // Displays drawer header information
      CustomListItem(Icons.flip_to_front, 'My Orders',
              () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => My_orders()))), // Displays Option in drawer
      CustomListItem(Icons.star, 'Rate us', () => {}),
      CustomListItem(Icons.phone_android, 'Contact us\n03157008877', () => {}),
    ]));
  }
}
