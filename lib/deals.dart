import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crepito99/home_page.dart';
import 'package:crepito99/my_flutter_app_icons.dart';
import 'package:crepito99/cart.dart';
class Deals extends StatefulWidget {
  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  String name="shawarma";
  int price=100;
  int qty=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:<Widget>[
          IconButton(//Icon button to go to profile
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          )
        ],
        backgroundColor: Colors.white,
        title: Text("select",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black)
        ),
        iconTheme: IconThemeData(color: Color(0xFFDB2C27)),
      ),
      drawer: new Drawer(// Drawer that contains additional options at left
          child:ListView(// 4 Options in Drawer
              children: <Widget>[
                CustomDrawerHeader(),// Displays drawer header information
                CustomListItem(Icons.flip_to_front,'My Orders',()=>{}),// Displays Option in drawer
                CustomListItem(Icons.star,'Rate us',()=>{}),
                CustomListItem(Icons.phone_android,'Contact us\n 03157008877',()=>{}),
              ]
          )
      ),
      bottomNavigationBar:BottomNavigationBar(
          unselectedItemColor: Color(0xFFDB2C27),
          selectedItemColor: Colors.black,

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
          onTap: (index){
            setState(() {
              //Updating screens on pressing bottomNavigationBar buttons
            });}
      ),
      body: Card(child:Row(
        children: <Widget>[
          Text(name),
          Text("$price"),
          FlatButton(
            child: Text("Add to Cart"),
            color: Colors.red,
            onPressed: (){
              ////USe this piece of code in menu screen

              cartData.cartItems+=1;
              cartData.itemNames.add(name);
              cartData.itemPrices.add(price);
              cartData.itemQty.add(1);
              cartData.updateData();
              Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => HomePage(2)));


            },
          )
        ],
      )),
    );
  }
}
