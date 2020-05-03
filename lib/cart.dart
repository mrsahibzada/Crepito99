import 'package:crepito99/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartDetails {
  var itemNames=[];
  var itemPrices=[];
  var itemQty=[];
  var deliveryAddress;
  Function updateData= () {


    subTotal=
            () {
          int sum=0;
          int len=cartData.itemQty.length;

          for(int i=0;i<len;i++)
          {
            sum+=cartData.itemQty[i]*cartData.itemPrices[i];
          }
          return sum;
        }();


  };
}


var cartData=CartDetails();
int subTotal=0;
int globalIndex=0;
class Cart extends StatefulWidget { //Class to display cart body 
  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> { //returns Cart object

int deliveryCharges=9;
  void temp(){
    setState((){print("temp");});
}
  @override

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Expanded(
          child: ListView.builder(

              itemCount:cartData.itemNames.length+1 ,
              itemBuilder: (context,index) {
                if(index<cartData.itemNames.length)
                {globalIndex=index;
                  return CartItem(()=>temp(),
                      cartData.itemQty[index],
                      cartData.itemNames[index],
                      cartData.itemPrices[index]);}
                else
                  {
                    return Container(
                      child:Column(children:<Widget>[
                        Popular('Oreo Shake',100,10),//Custom built class to display popular items with current order
                        DeliveryDetails("245 B Block Valencia Town"),// Custom class to display delivery details and change delivery details
                        //This is custom subtotal card
                        TotalBill(deliveryCharges),
                        BottomButtons(),
                      ]),//Custom class to display bottom buttons to further navigate
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
class CartItem extends StatefulWidget{ //Returns CartItem Object
  int itemQty;
  final Function callBack;
  String itemName;
  int itemPrice;

  CartItem(this.callBack,this.itemQty,this.itemName,this.itemPrice);

  @override
  _CartItem createState() => _CartItem(callBack,itemQty,itemName,itemPrice);
}
class _CartItem extends State<CartItem>{
  int itemQty;
  String itemName;
  int itemPrice;
  int indexOf=globalIndex;
  final Function callBack;


  _CartItem(this.callBack,this.itemQty,this.itemName,this.itemPrice);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(//Padding to the row widget
          padding: const EdgeInsets.fromLTRB(0,12,0,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,//To  maximize space between children
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                      color: Color(0xFFDB2C27),
                      size: 24),
                    onPressed: (){
                       setState(() {
                         if (cartData.itemQty[indexOf]>0)
                           {cartData.itemQty[indexOf]-=1;
                         subTotal-=itemPrice;
                           callBack();
                           }
                       });
                    },),
                    Text("${cartData.itemQty[indexOf]}",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                        fontWeight: FontWeight.w300
                        ),
                          ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Color(0xFFDB2C27),size:24),
                      onPressed: (){
                        setState(() {cartData.itemQty[indexOf]+=1;
                        subTotal+=itemPrice;
                            callBack();

                        });},),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,0,0,0),
                    child: Text(itemName,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 18
                    ),),
                  ),
                  ],

                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,20,0),
              child: Text("${(cartData.itemQty[indexOf])*itemPrice} PKR",
                style:TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Roboto"

                ) ,),
            )],
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


class Popular extends StatelessWidget{
  String itemName;
  var itemPrice;
  var loy_points;
  Popular(this.itemName,this.itemPrice,this.loy_points);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,8.0,0,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16,0,0,0),
            child: Text("Popular With Your Order",style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.normal,
              fontSize: 18

            ),),
          ),
          Card(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(itemName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                        color: Colors.black



                      ),),
                      Row(children: <Widget>[
                        Text("$itemPrice PKR + $loy_points Lps ",
                        style:TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                          color: Colors.black
                        )),
                        Icon(Icons.loyalty,color: Color(0xFFDB2C27),)
                      ],
                      )
                    ],
                  ),
                ),
                FlatButton(

                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.add,color: Color(0xFFDB2C27),),
                        Text("Add",
                            style:TextStyle(
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                                color: Colors.black
                            )),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
class DeliveryDetails extends StatefulWidget {
  String address;
  DeliveryDetails(this.address);
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState(address);
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  String address;
  _DeliveryDetailsState(this.address);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0,22,8,22),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text("Delivery Details",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
          color: Colors.black
          ),
        ),
        Text(address,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontFamily: "Roboto",
            color: Colors.black

          ),)
        ],


        ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,13,0),
              child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFDB2C27),
                    size: 18,),
                onPressed: (){
                  Navigator.pushNamed(context,'/delivery_details_page');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TotalBill extends StatelessWidget{
  int deliveryCharges;
  TotalBill(this.deliveryCharges);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(//Custom Subtotal card
      child: Container(
        color: Color(0xFFDB2C27),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12,19,12,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Subtotal",
                      style:TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                          fontSize: 18

                      )
                  ),
                  Text("$subTotal PKR",
                      style:TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                          fontSize: 15

                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12,10,12,9),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Delivery Charges",
                        style:TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                            fontSize: 18

                        )),
                    Text("$deliveryCharges PKR",
                        style:TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                            fontSize: 15

                        ))
                  ]


              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,0,12,0),
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,8.0,12.0,12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total",
                        style:TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 18

                        )),
                    Text("${subTotal+deliveryCharges} PKR",
                        style:TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 15

                        ))
                  ]


              ),
            )

          ],
        ),
      ),
    );


  }
}
class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         RaisedButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => HomePage(1)));
          },
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(9.0),
                 child: Icon(Icons.arrow_back_ios,color: Color(0xFFDB2C27),size:16),
               ),
               Padding(
                 padding: const EdgeInsets.all(9.0),
                 child: Text("Order More",
                   style: TextStyle(
                       color: Color(0xFFDB2C27),
                       fontSize: 14,
                       fontFamily: "Roboto",
                       fontWeight: FontWeight.w400,
                     letterSpacing: 1.25
                   ),),
               ),

             ],
           ),
           color: Colors.white,

         ),
          RaisedButton(
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text("Place Order",
                    style: TextStyle(
                        color: Color(0xFFDB2C27),
                        fontSize: 14,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                      letterSpacing: 1.25
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Icon(Icons.arrow_forward_ios,color: Color(0xFFDB2C27),size:16),
                ),

              ],
            ),
            color: Colors.white,

          ),

        ],
      ),
    );


  }
}

