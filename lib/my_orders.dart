import 'package:crepito99/BottomNavigationBar.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:flutter/material.dart';

class My_orders extends StatefulWidget {
  @override
  _My_ordersState createState() => _My_ordersState();
}

class _My_ordersState extends State<My_orders> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color(0xFFDB2C27)),
        primaryColor: Colors.white,
        accentColor: Color(0xFFDB2C27),
      ),
      home: Scaffold(
        appBar: Myappbar(
          cont: context,
          appBar: AppBar(),
          Title: "My Orders",
        ),
        bottomNavigationBar: bottombar(),
        body: Cart_orders(),
      ),
    );
  }
}

class CartDetails {
  var itemNames = [];
  var itemPrices = [];
  var itemQty = [];
  var deliveryAddress;
  Function updateData = () {
    subTotal = () {
      int sum = 0;
      int len = cartData.itemQty.length;

      for (int i = 0; i < len; i++) {
        sum += cartData.itemQty[i] * cartData.itemPrices[i];
      }
      return sum;
    }();
  };
}

var cartData = CartDetails();
int subTotal = 0;
int globalIndex = 0;

class Cart_orders extends StatefulWidget {
  //Class to display cart body
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart_orders> {
  //returns Cart object

  int deliveryCharges = 9;
  void temp() {
    setState(() {
      print("temp");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: cartData.itemNames.length + 1,
              itemBuilder: (context, index) {
                if (index < cartData.itemNames.length) {
                  globalIndex = index;
                  return CartItem(() => temp(), cartData.itemQty[index],
                      cartData.itemNames[index], cartData.itemPrices[index]);
                } else {
                  return Container(
                    child: Column(children: <Widget>[
                      TotalBill(deliveryCharges),
                    ]), //Custom class to display bottom buttons to further navigate
                  );
                }
              }),
        ),
      ],
    );
//    return Column(children: <Widget>[
//

    //  ],);
  }
}

class CartItem extends StatefulWidget {
  //Returns CartItem Object
  int itemQty;
  final Function callBack;
  String itemName;
  int itemPrice;

  CartItem(this.callBack, this.itemQty, this.itemName, this.itemPrice);

  @override
  _CartItem createState() => _CartItem(callBack, itemQty, itemName, itemPrice);
}

class _CartItem extends State<CartItem> {
  int itemQty;
  String itemName;
  int itemPrice;
  int indexOf = globalIndex;
  final Function callBack;

  _CartItem(this.callBack, this.itemQty, this.itemName, this.itemPrice);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          //Padding to the row widget
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, //To  maximize space between children
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove,
                          color: Color(0xFFDB2C27), size: 24),
                      onPressed: () {
                        setState(() {
                          if (cartData.itemQty[indexOf] > 0) {
                            cartData.itemQty[indexOf] -= 1;
                            subTotal -= itemPrice;
                            callBack();
                          }
                        });
                      },
                    ),
                    Text(
                      "${cartData.itemQty[indexOf]}",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                    IconButton(
                      icon: Icon(Icons.add, color: Color(0xFFDB2C27), size: 24),
                      onPressed: () {
                        setState(() {
                          cartData.itemQty[indexOf] += 1;
                          subTotal += itemPrice;
                          callBack();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        itemName,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  "${(cartData.itemQty[indexOf]) * itemPrice} PKR",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Roboto"),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Divider(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class TotalBill extends StatelessWidget {
  int deliveryCharges;
  TotalBill(this.deliveryCharges);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      //Custom Subtotal card
      child: Container(
        color: Color(0xFFDB2C27),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 19, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Subtotal",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                          fontSize: 18)),
                  Text("$subTotal PKR",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                          fontSize: 15))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 9),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Delivery Charges",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                            fontSize: 18)),
                    Text("$deliveryCharges PKR",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                            fontSize: 15))
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                    Text("${subTotal + deliveryCharges} PKR",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 15))
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            "Place Order",
                            style: TextStyle(
                                color: Color(0xFFDB2C27),
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Icon(Icons.arrow_forward_ios,
                              color: Color(0xFFDB2C27), size: 16),
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
