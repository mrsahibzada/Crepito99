import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:crepito99/Tracking.dart';
import 'package:crepito99/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'BottomNavigationBar.dart';

class My_orders extends StatefulWidget {
  @override
  _My_ordersState createState() => _My_ordersState();
}

class _My_ordersState extends State<My_orders> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Myappbar(
          cont: context,
          appBar: AppBar(),
          Title: 'My Orders',
        ),
        bottomNavigationBar: bottombar(),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("myorders")
              .document(uid)
              .snapshots(),
          builder: (context, snapshot) {
            try {
              if (!snapshot.hasData) return Text("loading...");

              var temp = snapshot.data["orderList"];
              var len = snapshot.data["orderList"].length;
              if (len == 0)
                return Center(
                    child: Text("Place Some Order!",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontFamily: 'Roboto')));
              return ListView.builder(
                  itemCount: len,
                  itemBuilder: (context, index) {
                    return StreamBuilder(
                      stream: Firestore.instance
                          .collection("orders")
                          .document(snapshot.data["orderList"][len - 1 - index]
                              .toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        try {
                          if (!snapshot.hasData) return Text("Loading");
                          return (OrderItem(
                              temp[len - 1 - index],
                              snapshot.data["totalBill"],
                              snapshot.data["state"],
                              snapshot.data["itemList"],
                              snapshot.data["itemPrices"],
                              snapshot.data["itemQty"],
                              snapshot.data["timeStamp"],
                              snapshot.data["status"],
                              0));
                        } catch (e) {
                          return Text("Invalid Entry");
                        }
                      },
                    );
                  });
            } catch (e) {
              return Text("Place Some Order!",
                  style: TextStyle(
                      color: Colors.grey, fontSize: 20, fontFamily: 'Roboto'));
            }
          },
        ));
  }
}

class OrderItem extends StatelessWidget {
  int deliveryCharges;
  int totalBill;
  int state;
  var timeStamp;
  var orderStatus;
  var items;
  var prices;
  var qty;
  int feedBack;
  OrderItem(this.deliveryCharges, this.totalBill, this.state, this.items,
      this.prices, this.qty, this.timeStamp, this.orderStatus, this.feedBack);
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
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 9),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Order ID",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                            fontSize: 18)),
                    Text("$deliveryCharges",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                            fontSize: 20))
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 19, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Status",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                          fontSize: 18)),
                  state == 0
                      ? JumpingText("Processing...",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                              fontSize: 18))
                      : Text("Completed",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                              fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 9),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Date",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                            fontSize: 18)),
                    Text("$timeStamp",
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
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 9),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('${qty[index]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('${items[index]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15)),
                        ],
                      ),
                      Text('${prices[index]}',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                              fontSize: 15)),
                    ],
                  );
                },
              ),
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
                    Text("${totalBill} PKR",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 15))
                  ]),
            ),
            feedBack == 0
                ? state == 0
                    ? RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  TrackOrder(deliveryCharges.toString())));
                        },
                        color: Colors.white,
                        child: Text("Track Your Order",
                            style: TextStyle(
                                color: Color(0xFFDB2C27),
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                fontSize: 18)),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () {},
                          child: Text("Leave Feedback",
                              style: TextStyle(
                                  color: Color(0xFFDB2C27),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18)),
                        ),
                      )
                : Container()
          ],
        ),
      ),
    );
  }
}
