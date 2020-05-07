import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:firebase_auth/firebase_auth.dart';

class googleMaps extends StatefulWidget {
  @override
  _googleMapsState createState() => _googleMapsState();
}

class _googleMapsState extends State<googleMaps> {
  @override
//  void initState() {
//    _animateToUser();
//    super.initState();
//  }

  @override
//  Completer<GoogleMapController> _controller=Completer();
  GoogleMapController _controller;
  Location location= Location();
  Firestore _firestore= Firestore.instance;
  final _auth= FirebaseAuth.instance;
  Geoflutterfire geo= Geoflutterfire();
  static LatLng _center= const LatLng(31.5204,74.3587);
  MapType _currentMapType= MapType.normal;
  final Set<Marker> _markers= {};
  LatLng _lastMapPosition= _center;
  String uid;


  _animateToUser()async{
    var pos= await location.getLocation();

    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(pos.latitude , pos.longitude),
      zoom: 15.0,
    )));

  }
  Future _addGeoPoint() async{
    _animateToUser();
    final FirebaseUser user = await _auth.currentUser();
    uid = user.uid;
    var pos= await location.getLocation();
    GeoFirePoint point= geo.point(latitude: pos.latitude, longitude: pos.longitude);
    final CollectionReference profile_Collection= Firestore.instance.collection('profile');
    return await profile_Collection.document(uid).updateData({
      'address': point.data,
    });
  }
//  _addMarker(){
//    var marker= Marker(
//      position: _controller.
//    )
//  }

  _onMapCreated(GoogleMapController controller){
    setState(() {
      _controller= controller;
    });
  }
  _onCameraMove(CameraPosition position){
    _lastMapPosition=position.target;
  }
  _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'This is a title',
          snippet: 'This is a snippet',
        ),
        icon: BitmapDescriptor.defaultMarker,
        draggable: true,
      ));
    });

  }
  Widget button(Function function, IconData icon){
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.red,
      child: Icon(icon,size: 36.0,),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(

        appBar: Myappbar(
          cont:context,
          appBar: AppBar(),
          Title: 'Map',
      ) ,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(31.5204,74.3587),
              zoom: 12.0,

            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
            myLocationButtonEnabled: true,
          ),
          Positioned(
            bottom: 50.0,
            right: 10.0,
            child: FlatButton(
              child: Icon(Icons.pin_drop,color: Colors.white,),
              color: Colors.green,
              onPressed: _addGeoPoint,
            ),
          ),
        ],
        ),
      ),

    );
  }
}
