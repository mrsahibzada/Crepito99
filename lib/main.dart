import 'package:crepito99/home_page.dart';
import 'package:crepito99/login_screen.dart';
import 'package:crepito99/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      '/signup': (context) => SignupScreen(),
      '/deals_page': (context) => HomePage(0),
    },
  ));
}
