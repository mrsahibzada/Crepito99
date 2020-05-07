import 'package:flutter/material.dart';
import 'package:crepito99/cart.dart';
import 'package:crepito99/home_page.dart';
import 'package:crepito99/login_screen.dart';
class menuItem extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemLP;
  menuItem(
      {@required this.itemName,
        @required this.itemPrice,
        @required this.itemLP});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.local_offer,
              color: Colors.red,
            ),
            Text(itemLP),
          ],
        ),
        title: Text(itemName),
        trailing: Wrap(
          alignment: WrapAlignment.start,
          children: <Widget>[
            Text(itemPrice),
            SizedBox(
              width: 30.0,
            ),
            InkWell(

              child: Icon(Icons.add_shopping_cart,
                color: Colors.red,),
              onTap: (){
                String price=itemPrice.substring(0,itemPrice.length-4);
cartData.cartItems+=1;
              cartData.itemNames.add(itemName);
                cartData.itemPrices.add(int.parse(price));
            cartData.itemQty.add(1);
        cartData.updateData();

                cartData.refresh();

        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => HomePage(2)));
                          },
            )
          ],
        ));
  }
}