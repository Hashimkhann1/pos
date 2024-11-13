import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/res/root/root.dart';
import 'package:pos/view/authentication/login_view.dart';
import 'package:pos/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';

import '../../view/branch/sale_invoice/sale_invoice_view.dart';
import '../bloc/loading_bloc/loading_bloc_event/loading_bloc_event.dart';


class AuthenticationViewModel {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('stores');


  Future addInitialStoreData(BuildContext context, String id , storeName , email) async {
    try{

      await _firestore.doc(id).set({
        "storeId" : id,
        "storeName" : storeName,
        "storeEmail" : email,
        "createdData" : DateTime.now()
      }).then((value) {
      });
    }catch(error) {
      if(kDebugMode){
        print("Error while adding initil User Data >>>>>>>>> $error");
      }
    }
  }


  /// sign in method
  Future<void> signIn(BuildContext context , String email , password) async {
    context.read<LoadingBloc>().add(SetLoading());
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        // Utils.toastMessage("User Sign in successfully");
        context.read<LoadingBloc>().add(SetLoading());
        Navigator.push(context, MaterialPageRoute(builder: (context) => SaleInvoiceView()));
      });
    }on FirebaseAuthException catch(error){
      context.read<LoadingBloc>().add(SetLoading());
      if(kDebugMode){
        print("Error while signing up from AuthViewModel >>>>>>> ${error.message} >>>>");
      }
    }
  }

  // sign Up method
  Future<void> signUp(BuildContext context , String storeName , email , password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        await addInitialStoreData(context , value.user!.uid.toString(), storeName , email );
        // Utils.toastMessage("User Sign up successfully");
        print("Sign Up");
        Navigator.push(context, MaterialPageRoute(builder: (context) => SaleInvoiceView()));
      });
    }on FirebaseAuthException catch(error){
      // Utils.toastMessage(error.code);
      if(kDebugMode){
        print("Error while signing up from AuthViewModel >>>>>>> ${error.message} >>>>");
      }
    }
  }


  /// sign out
  void signOut(BuildContext context) async {
    try{
      await _auth.signOut().then((value) {
        // Utils.toastMessage("User Sign out Successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
      });
    }on FirebaseAuthException catch(error) {
      // Utils.toastMessage(error.code);
      if(kDebugMode){
        print("error while signing out from AuthVireModel >>>>> ${error.message}");
      }
    }
  }

}