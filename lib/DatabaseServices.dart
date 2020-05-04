import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference account_Collection= Firestore.instance.collection('account');
  final CollectionReference profile_Collection= Firestore.instance.collection('profile');
  Future updateAccount(String name, String email, String password,String uid ) async{
    return await account_Collection.document(uid).setData({
      'name' : name,
      'email' : email,
      'password': password,
      'uid': uid,
    });
  }
  Future updateProfile(String name,String mobileNumber,String address,int loyaltyPoints,String email, String password ) async{
    return await profile_Collection.document(uid).setData({
      'name': name,
      'email': email,
      'password': password,
      'mobileNumber': mobileNumber,
      'loyaltyPoints': loyaltyPoints,
      'address': address,
    });
  }
  Stream<QuerySnapshot> get profile{
    return profile_Collection.snapshots();
  }
}