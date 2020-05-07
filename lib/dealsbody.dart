import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crepito99/dealItem.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class dealsbody extends StatefulWidget {
  @override
  _dealsbodyState createState() => _dealsbodyState();
}

class _dealsbodyState extends State<dealsbody> {
  Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('deals').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return CircularProgressIndicator();
              final data = snapshot.data.documents;
              List<Cardviewer> cardWidgets = [];
              for (var items in data) {
                print(items.data['name']);
                final name = items.data['name'];
                final price = items.data['price'].toString();
                final details = items.data['details'];
                final path = items.data['imagePath'];
                final card = Cardviewer(name, details, path,price);
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
  final String price;
  const Cardviewer(this.name, this.details, this.path,this.price);
  @override
  _CardviewerState createState() => _CardviewerState();
}

class _CardviewerState extends State<Cardviewer> {
  var myWidget;
  var url;
  @override
  initState() {
    super.initState();
  }

  downloadImage() async {
    int length = widget.path.length;
    // no need of the file extension, the name will do fi

    url=await FirebaseStorage.instance.ref().child('${widget.path}').getDownloadURL();

    url!=null ? setState((){}):print("wait");
        return url;
  }

  Widget build(BuildContext context) {
    if (url==null)
     url=this.downloadImage();
    return url==null ? Text("loading") :Card(
      child: deal_item(
        dealsPrices: int.parse(widget.price),
        name: widget.name,
        detail: widget.details,
        imagePath: url.toString(),
      ),
    );
  }
}
