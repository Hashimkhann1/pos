



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AddCategoryViewModel {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('stores');


  // add product category to firebase
  Future<void> addCategory(BuildContext context , String categoryName) async {
    try{
      await _firestore.doc(_auth.currentUser!.uid.toString()).update({
        'productsCategory': FieldValue.arrayUnion([categoryName.toString()])
      }).then((value) {
        if(kDebugMode){
          print("Category is added >>>>>>>>>>> :)");
        }
      });
    }catch(error){
      if(kDebugMode){
        print("Error while Adding Category from AddCategoryViewModel $error");
      }
    }
  }

  // Remove Category from firebase
  Future<void> removeCategory(BuildContext context , String categoryName) async {
    try{
      await _firestore.doc(_auth.currentUser!.uid.toString()).update({
        'productsCategory': FieldValue.arrayRemove([categoryName.toString()])
      }).then((value) {
        if(kDebugMode){
          print("Category is removed >>>>>>>>>>> :)");
        }
      });
    }catch(error){
      if(kDebugMode){
        print("Error while Removing Category from AddCategoryViewModel $error");
      }
    }
  }

}