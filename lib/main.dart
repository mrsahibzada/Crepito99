import 'package:crepito99/Profile_page.dart';
import 'package:crepito99/home_page.dart';
import 'package:crepito99/login_screen.dart';
import 'package:crepito99/signup_screen.dart';
import 'package:flutter/material.dart';
import 'DeliveryDetailsPage.dart';
import 'googlemaps.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
//      '/': (context) => Profile_page(),
      '/signup': (context) => SignupScreen(),
      '/deals_page': (context) => HomePage(0),
        '/delivery_details_page': (context) => DeliveryDetailsPage(),
      '/profile_page': (context) => Profile_page(),

    },
  ));
}
//void main(){
////  runApp(DeliveryDetailsPage());
//    runApp(googleMaps());
//}