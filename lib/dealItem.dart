import 'package:flutter/material.dart';
import 'package:crepito99/cart.dart';
import 'package:crepito99/home_page.dart';

class deal_item extends StatelessWidget {
  final String name;
  final String detail;
  int dealsPrices;
  final String imagePath;

  deal_item({@required this.dealsPrices,@required this.imagePath,@required this.name, @required this.detail});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: Image.network(imagePath,
      height: 40,
          width: 40,
        fit:BoxFit.cover
      ),
      title: Text(name),
      subtitle: Text(detail),
      trailing: InkWell(

        child: Icon(Icons.add_shopping_cart,
          color: Colors.red,),
        onTap: (){
          cartData.itemNames.add(name);
          cartData.itemPrices.add(dealsPrices);
          cartData.itemQty.add(1);
          cartData.cartItems+=1;
          cartData.updateData();
          cartData.refresh();
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => HomePage(2)));
        },
      ),
    );
  }
}
