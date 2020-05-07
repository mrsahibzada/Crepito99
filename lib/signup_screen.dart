//import 'dart:html';

import 'package:crepito99/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crepito99/login_screen.dart';
import 'DatabaseServices.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _rememberMe = false;
  String password;
  String name = '';
  String email;
  String mobileNumber = '';
  String address = '';
  int loyaltyPoints = 0;

  String errorMessage;

  final _auth = FirebaseAuth.instance;

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        Text(
//          'Your Name?',
//          style: TextStyle(color: Colors.black, fontFamily: 'kLabelStyle'),
//        ),
//        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) {
              name = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xFFDB2C27),
                ),
                hintText: 'Enter Your Name',
                hintStyle: kHintTextStyle),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        Text(
//          'Password?',
//          style: TextStyle(color: Colors.black, fontFamily: 'kLabelStyle'),
//        ),
//        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFFDB2C27),
                ),
                hintText: 'Enter Your Password',
                hintStyle: kHintTextStyle),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        Text(
//          'Your Email?',
//          style: TextStyle(color: Colors.black, fontFamily: 'kLabelStyle'),
//        ),
//        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) {
              email = value;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xFFDB2C27),
                ),
                hintText: 'Enter Your Email Address',
                hintStyle: kHintTextStyle),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonTF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 175.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: email.trim(), password: password);
            FirebaseUser user = newUser.user;
            uid = user.uid;
            await DatabaseService(uid: user.uid)
                .updateAccount(name, email, password, uid);
            await DatabaseService(uid: user.uid).updateProfile(
                name, mobileNumber, address, loyaltyPoints, email, password);
            await DatabaseService(uid:uid).updateMyOrders([]);
            if (newUser != null) {

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage(0)));
            }
          } catch (e) {
            switch (e.code) {
              case "ERROR_INVALID_EMAIL":
                errorMessage = "Your email address appears to be malformed.";
                break;
              case "ERROR_WRONG_PASSWORD":
                errorMessage = "Your password is wrong.";
                break;
              case "ERROR_USER_NOT_FOUND":
                errorMessage = "User with this email doesn't exist.";
                break;
              case "ERROR_USER_DISABLED":
                errorMessage = "User with this email has been disabled.";
                break;
              case "ERROR_TOO_MANY_REQUESTS":
                errorMessage = "Too many requests. Try again later.";
                break;
              case "ERROR_OPERATION_NOT_ALLOWED":
                errorMessage =
                    "Signing in with Email and Password is not enabled.";
                break;
              default:
                errorMessage = "An undefined Error happened.";
            }
            if (errorMessage != null) {
              return Future.error(errorMessage);
            }
          }
        },
        padding: EdgeInsets.all(15.0),
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 12.0),
            Text(
              'LETS EAT',
              style: TextStyle(
                  color: Color(0xFFDB2C27),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans'),
            ),
            SizedBox(width: 10.0),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0XFFFAFAFA),
                  Color(0XFFF5F5F5),
                  Color(0XFFEEEEEE),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 90.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 60.0),
                  _buildNameTF(),
                  SizedBox(height: 35.0),
                  _buildEmailTF(),
                  SizedBox(height: 35.0),
                  _buildPasswordTF(),
                  SizedBox(height: 30.0),
                  _buildButtonTF(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kLabelStyle = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kHintTextStyle = TextStyle(
  color: Colors.black54,
  fontFamily: 'OpenSans',
);
