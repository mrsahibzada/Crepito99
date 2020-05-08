import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crepito99/cart.dart';
import 'package:crepito99/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var uid;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  String password;
  String email;
  final _auth = FirebaseAuth.instance;
  String errorMessage;
  bool credential_check = false;
  void initialize() async {
    try {
      final _auth = FirebaseAuth.instance;
      final FirebaseUser user = await _auth.currentUser();
      uid = user.uid;
      var data =
          await Firestore.instance.collection('cart').document(uid).get();
      cartData.cartItems = data['NoOfItems'];
      cartData.itemNames = data['itemList'];
      cartData.itemPrices = data['itemPrices'];
      cartData.itemQty = data['itemQty'];
      cartData.updateData();
    } catch (e) {
      final _auth = FirebaseAuth.instance;
      final FirebaseUser user = await _auth.currentUser();
      uid = user.uid;
      cartData.cartItems = 0;
      cartData.itemNames = [];
      cartData.itemPrices = [];
      cartData.itemQty = [];
      print(e);
    }
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        Text(
//          'Password?',
//          style: TextStyle(color: Colors.black, fontFamily: 'kLabelStyle'),
//        ),
//        SizedBox(height: 5.0),
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

  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        Text(
//          'Your Email?',
//          style: TextStyle(color: Colors.black, fontFamily: 'kLabelStyle'),
//        ),
//        SizedBox(height: 5.0),
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
            final newUser = await _auth.signInWithEmailAndPassword(
                email: email.trim(), password: password);
            initialize();
            if (newUser != null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage(0)));
            }
          } catch (e) {
            switch (e.code) {
              case "ERROR_INVALID_EMAIL":
                errorMessage = "Your email address appears to be malformed.";
                break;
              case "ERROR_USER_DISABLED":
                errorMessage = "User with this email has been disabled.";
                break;
              case "ERROR_TOO_MANY_REQUESTS":
                errorMessage = "Too many requests. Try again later.";
                break;
              default:
                errorMessage = "An undefined Error happened.";
            }
            if (errorMessage != null) {
              setState(() {
                credential_check = true;
              });
              return Future.error(errorMessage);
            }
          }
        },
        padding: EdgeInsets.all(15.0),
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text(
          'LETS EAT',
          style: TextStyle(
              color: Color(0xFFDB2C27),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox_ForgotPassword() {
    return Container(
      height: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.black54),
                child: Checkbox(
                  value: _rememberMe,
                  checkColor: Color(0xFFDB2C27),
                  activeColor: Colors.black54,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value;
                    });
                  },
                ),
              ),
              Text(
                'Remember me',
                style: kLabelStyle,
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              onPressed: () async {
                await _auth.sendPasswordResetEmail(email: email);
              },
              padding: EdgeInsets.only(left: 0.0),
              child: Text(
                'Forgot Password?',
                style: kLabelStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/signup'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGOTOButtonTF() {
    return Container(
//      padding: EdgeInsets.symmetric(vertical: 25.0),
//      width: 175.0,
//      child: RaisedButton(
//        elevation: 5.0,
//        onPressed: () => Navigator.pushNamed(context, '/deals_page'),
//        padding: EdgeInsets.all(12.0),
////        shape:
////            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//        color: Colors.white,
//        child: Row(
//          children: <Widget>[
//            SizedBox(width: 35.0),
//            Text(
//              'MENU',
//              style: TextStyle(
//                  color: Color(0xFFDB2C27),
//                  letterSpacing: 1.5,
//                  fontSize: 18.0,
//                  fontWeight: FontWeight.w600,
//                  fontFamily: 'OpenSans'),
//            ),
//            SizedBox(width: 5.0),
//            Icon(
//              Icons.arrow_forward,
//              color: Colors.black,
//            )
//          ],
//        ),
//      ),
        );
  }

  Widget _buildOrText() {
    return Column(
//      children: <Widget>[
//        Text(
//          '- OR -',
//          style: TextStyle(
//            color: Colors.black,
//            fontWeight: FontWeight.w600,
//            fontSize: 14.0,
//          ),
//        ),
//      ],
        );
  }

  Widget _TextTF() {
    return Visibility(
        visible: credential_check ? true : false,
        child: Container(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Text(
            "Incorrect Email or Password",
            style: TextStyle(
                color: Color(0xFFDB2C27),
                letterSpacing: 1.5,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans'),
          ),
        ));
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
                vertical: 60.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 35.0),
                  _buildPhoneTF(),
                  SizedBox(height: 35.0),
                  _buildPasswordTF(),
                  SizedBox(height: 20.0),
                  _buildRememberMeCheckbox_ForgotPassword(),
//                  SizedBox(height: 10.0),
                  _TextTF(),
                  SizedBox(height: 10.0),
                  _buildButtonTF(),
                  _buildOrText(),
                  _buildGOTOButtonTF(),
                  SizedBox(height: 75.0),
                  _buildSignupBtn(),
//                  SizedBox(height: 15.0),
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
