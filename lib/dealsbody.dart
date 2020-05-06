import 'package:crepito99/dealItem.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class dealsbody extends StatefulWidget {
  @override
  _dealsbodyState createState() => _dealsbodyState();
}

class _dealsbodyState extends State<dealsbody> {


  Firestore _firestore = Firestore.instance;
  @override

  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('deals').snapshots(),
            builder: (context, snapshot) {
              final data = snapshot.data.documents;
              List<Cardviewer> cardWidgets = [];
              for (var items in data) {
                print(items.data['name']);
                final name = items.data['name'];
//                final price = items.data['price'].toString();
                final details = items.data['details'];
                final path = items.data['imagePath'];
                final card = Cardviewer(name, details, path);
                cardWidgets.add(card);
              }
              return Expanded(
                child: ListView(
                  children: cardWidgets,
                ),
              );
            },
          ),
        ]));

  }
}




class Cardviewer extends StatefulWidget {


  final String name;
  final String details;
  final String path;
  const Cardviewer(this.name, this.details,this.path);
  @override
  _CardviewerState createState() => _CardviewerState();


}

class _CardviewerState extends State<Cardviewer> {


  @override
  initState(){
    super.initState();
    downloadImage();
  }
  downloadImage()async {

    int length= widget.path.length;
    String imagePath= widget.path.substring(28,length);
    StorageReference ref = FirebaseStorage.instance.ref().child('$imagePath');


// no need of the file extension, the name will do fine.

    print(widget.path);
    var url;
    print('hello');
    url = await ref.getDownloadURL();
    print('hello');
    url=url.toString();
    print(url);
  }


    Widget build(BuildContext context) {
      return Card(
        child: deal_item(
          name: widget.name,
          detail: widget.details,
          imagePath: 'https://i.stack.imgur.com/8szbk.png',
        ),);
    }
  }




