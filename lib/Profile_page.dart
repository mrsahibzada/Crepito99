import 'package:crepito99/BottomNavigationBar.dart';
import 'package:crepito99/MyAppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'BottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'DatabaseServices.dart';

class Profile_page extends StatefulWidget {
  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  initState() {
    inputData();
    super.initState();
//    name=userData[name];
//    number=userData[name];

    textController.addListener(() {
      final text = textController.text;
      textController.value = textController.value.copyWith(
        text: text,
      );
    });
  }

  void inputData() async {
    final FirebaseUser user = await _auth.currentUser();
    uid = user.uid;
    profileData =
        await Firestore.instance.collection('profile').document(uid).get();
    accountData =
        await Firestore.instance.collection('account').document(uid).get();
    textController.text = profileData['name'];
    numberController.text = profileData['mobileNumber'];
    addressController.text = profileData['address'];
    loyaltyPointController.text = (profileData['loyaltyPoints']).toString();
    emailController.text = profileData['email'];
    passwordController.text = profileData['password'];
  }

  var accountData;
  var profileData;
  String uid;
  FirebaseUser loggedInUser;
  String name;
  String number;
  int loyaltyPoints;
  String password;
  String location;
  final _auth = FirebaseAuth.instance;
  final CollectionReference profile_Collection =
      Firestore.instance.collection('profile');
  final CollectionReference account_Collection =
      Firestore.instance.collection('account');
  var textController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final loyaltyPointController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//    return StreamProvider<QuerySnapshot>.value(
//      value: DatabaseService().profile,
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.red),
//        primaryColor: Colors.black87,
        accentColor: Colors.red,
      ),
      home: Scaffold(
        appBar: Myappbar(
          cont: context,
          appBar: AppBar(),
          Title: "Profile",
        ),
        bottomNavigationBar: bottombar(),
        body: ListView(
//        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100.0,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
//                  ),
                    ),
                  ),
//
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        name = value;
                      },
                      onEditingComplete: () async {
                        await profile_Collection.document(uid).updateData({
                          'name': name,
                        });
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Mobile Number',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    child: TextField(
                      controller: numberController,
                      onChanged: (value) {
                        number = value;
                      },
                      onEditingComplete: () async {
                        await profile_Collection.document(uid).updateData({
                          'mobileNumber': number,
                        });
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Default Address',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    child: TextField(
                      controller: addressController,
//                    readOnly: true,
                      onChanged: (value) {
                        location = value;
                      },
                      onEditingComplete: () async {
                        await profile_Collection.document(uid).updateData({
                          'address': location,
                        });
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit_location,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                          },
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Loyalty Points',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 13.0, 10.0, 0.0),
                    child: TextField(
                      readOnly: true,
                      controller: loyaltyPointController,
//                    keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 13.0, 10.0, 0.0),
                    child: TextField(
                      readOnly: true,
                      controller: emailController,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      onChanged: (value) {
                        number = value;
                      },
                      onEditingComplete: () async {
                        await profile_Collection.document(uid).updateData({
                          'password': password,
                        });
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
