import 'package:flutter/material.dart';
import 'Profile_page.dart';

class Myappbar extends StatelessWidget implements PreferredSizeWidget {
  final String Title;
  final AppBar appBar;
  var cont;

  Myappbar({this.cont,this.Title, this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: FloatingActionButton(

              mini: true,
              backgroundColor:  Color(0xFFDB2C27),
              onPressed: (){Navigator.pop(cont);},
              tooltip: 'back',
              child: new Icon(Icons.arrow_back_ios, color:Colors.white, size: 14,)),
        ),
      ),

      actions:<Widget>[
        IconButton(//Icon button to go to profile
          icon: Icon(Icons.account_circle),
          onPressed: (){
//            Navigator.pushNamed(context,'/profile_page');
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Profile_page()));
          },
        )
      ],
      backgroundColor: Colors.white,
      title: Text(Title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black)
      ),
      iconTheme: IconThemeData(color: Color(0xFFDB2C27)),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
