import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crepito99/BottomNavigationBar.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:crepito99/home_page.dart';
var progress=[2,1,0,0];
class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: <Widget>[
          IconButton(
            //Icon button to go to profile
            icon: Icon(Icons.account_circle),
            onPressed: () {
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => Profile_page()));
            },
          )
        ],
        backgroundColor: Colors.white,
        title: Text("Tracking",
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Color(0xFFDB2C27)),),
      body: Center(
        child: Column(
            children: <Widget>[
              CheckList(0,progress[0],"Order accepted"),
              CheckList(1,progress[1],"We are preparing your food!"),
              CheckList(2,progress[2],"Your food's on its way!"),
              CheckList(3,progress[3],"Order delivered!"),
              Padding(
                padding: const EdgeInsets.all(63.0),
                child: Center(child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Order More",
                        style: TextStyle(
                            color:Colors.white
                        ),),
                    ),
                    onPressed: (){
                      print("pressed");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(1)));

                    },
                    color: Color(0xFFDB2C27)
                ),),
              )
            ]),
      ),
      drawer:  Drawer(
        // Drawer that contains additional options at left
          child: ListView(// 4 Options in Drawer
              children: <Widget>[
                CustomDrawerHeader(), // Displays drawer header information
                CustomListItem(Icons.flip_to_front, 'My Orders',
                        () => print("workkkk")), // Displays Option in drawer
                CustomListItem(Icons.star, 'Rate us', () => {}),
                CustomListItem(
                    Icons.phone_android, 'Contact us\n03157008877', () => {}),
              ])),
      bottomNavigationBar: bottombar(),

    );
  }
}
class CheckList extends StatelessWidget {
  int record;
  int currentState;

  String detail;
  CheckList(this.record,this.currentState,this.detail);
  @override
  Widget build(BuildContext context) {
    Widget myWidget;
    Color myColor;
    if(currentState==1)
    {
      myWidget=JumpingDotsProgressIndicator(
        fontSize: 20.0,

      );
      myColor=Colors.red;
    }
    else
    {if(currentState==0)
    {myColor=Colors.grey;
    myWidget=Icon(Icons.check_box_outline_blank,color:myColor);
    }
    else
    {myColor= Color(0xFFDB2C27);
    myWidget=Icon(Icons.check_box,color:  Color(0xFFDB2C27),);
    }

    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(28,63.0,0,0),
      child: Row(

        children: <Widget>[
          myWidget,
          SizedBox(width: 20,),

          Text(detail,style: TextStyle(
              fontSize: 18 ,
              color: myColor,
              fontFamily: 'Roboto'
          ),),
        ],
      ),
    );
  }
}