import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference account_Collection= Firestore.instance.collection('account');
  final CollectionReference profile_Collection= Firestore.instance.collection('profile');
  final CollectionReference cart_Collection = Firestore.instance.collection('cart');
  final CollectionReference order_Collection= Firestore.instance.collection('orders');
  final CollectionReference my_Orders= Firestore.instance.collection('myorders');
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
  Future updateCart(var itemList, var noOfItems,var itemQty, var itemPrices ) async{
    return await cart_Collection.document(uid).setData({
      'itemList' : itemList,
      'NoOfItems': noOfItems,
      'itemQty': itemQty,
      'itemPrices':itemPrices

    });
  }
  Future updateOrders(var order_no,var itemList, var noOfItems,var itemQty, var itemPrices,var status, var totalBill,var timeStamp ,var state,int feedBack) async{
    return await order_Collection.document("${order_no}").setData({
      'itemList' : itemList,
      'NoOfItems': noOfItems,
      'itemQty': itemQty,
      'itemPrices':itemPrices,
      'status':status,
      'totalBill':totalBill,
      'timeStamp':timeStamp,
      'state':state,
      'feedBack':feedBack,
      'userID':uid


    });
  }

  Future updateMyOrders( var itemList ) async{
    return await my_Orders.document(uid).setData({
      'orderList' : itemList,


    });
  }

  Stream<QuerySnapshot> get profile{
    return profile_Collection.snapshots();
  }
}