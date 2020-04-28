import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:crepito99/my_flutter_app_icons.dart';


class Menu extends StatefulWidget {
  Menu({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridViewList(),
      appBar: AppBar(
        actions:<Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          )
        ],
        backgroundColor: Colors.white,
        title: Text('Menu',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black)
        ),
        iconTheme: IconThemeData(color: Colors.red),
      ),
      drawer: new Drawer(


          child:ListView(

              children: <Widget>[

                ProfileDisplay('Ahmed','2016n2726@gmail.com'),
//            FloatingActionButton(onPressed: (){},
//                tooltip: 'back',
//                child: new Icon(Icons.arrow_back_ios)),
                CustomListItem(Icons.flip_to_front,'My Orders',()=>{}),
                CustomListItem(Icons.star,'Rate us',()=>{}),
                CustomListItem(Icons.phone_android,'Contact us\n 03157008877',()=>{}),
              ]
          )
      ),
      bottomNavigationBar: BottomNavBaR(),
    );
  }
}


class CustomListItem extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap;
  CustomListItem(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.pinkAccent,
        onTap:onTap,
        child: Padding(
          padding:  const EdgeInsets.fromLTRB(0.0,30.0-12.0,0.0,.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24,0,28,0),
                      child: Icon(icon,size:22),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(text,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal

                          )),
                    ),
                  ],
                )
              ]
          ),
        )
    );

  }
}
class ProfileDisplay extends StatelessWidget{
  String name;
  String email;
  ProfileDisplay(this.name,this.email);
  @override
  Widget build(BuildContext context) {
    // TODO: User build
    return Container(
      color: Colors.red,
      child: DrawerHeader(child:ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 40,
              width:40,
              child: FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.white,
                  onPressed: (){Navigator.pop(context);},
                  tooltip: 'back',
                  child: new Icon(Icons.arrow_back_ios, color:Colors.red, size: 14,)),
            ),
          )
        ],
      ),

      ),
    );
  }
}
class Item extends StatelessWidget {
  //src video
  //https://www.youtube.com/watch?v=m1XHj305zns
  String name;
  String urlofimg;
  Item(this.name,this.urlofimg);
  @override
  Widget build(BuildContext context){
    return InkWell(
      splashColor: Colors.black,
      onTap: (){},
      child: Container(
          height:100,
          width:100,
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation :10.0,
              child: Column(


                //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Image.asset(urlofimg,

                        height: 193,
                        width: 175,
                        fit:BoxFit.cover),
                    new SizedBox(height:1.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
                      child: new Text(name,
                          textAlign: TextAlign.center,
                          style:TextStyle(fontSize: 20.0 , fontFamily:'Roboto', fontWeight: FontWeight.normal  )),
                    )
                  ]
              )
          )

      ),
    );
  }
}


class GridViewList extends StatefulWidget{
  _GridExtended createState()=>new _GridExtended();
}
class _GridExtended extends State<GridViewList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: GridView.count(crossAxisCount: 2,
          childAspectRatio: (170/263),
          children: <Widget>[
            Item('Shawarma','assets/images/Shawarma.png'),
            Item('Sandwitches','assets/images/Sandwitch.png'),
            Item('Burger','assets/images/Burger.png'),
            Item('Wraps','assets/images/Wraps.png'  ),
            Item('Ice-cream Shakes','assets/images/Ice-cream.png'),
            Item('Beverages','assets/images/Beverages.png'),
            Item('Blizzards','assets/images/Blizzards.png'),
            Item('Specials','assets/images/Mix.png')
          ],)
    );
  }

}
class BottomNavBaR extends StatefulWidget{

  _ExtendedBottomNavBaR createState() => _ExtendedBottomNavBaR();
}
class _ExtendedBottomNavBaR extends State<BottomNavBaR>{
  int myindex=1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        unselectedItemColor: Colors.red,
        selectedItemColor: Colors.black,
        currentIndex: myindex,
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
            myindex=index;
            if(index==1)
            {
              Navigator.pushNamed(context,'/');
            }
            if(index==0)
            {
              Navigator.pushNamed(context,'/deals');
            }
            if(index==2)
            {
              Navigator.pushNamed(context,'/cart');
            }
          });
        }

    );
  }

}