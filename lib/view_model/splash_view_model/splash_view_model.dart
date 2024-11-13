



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos/view/authentication/login_view.dart';
import 'package:pos/view/branch/sales_products_view/all_products_and_total_view/all_products_and_total_view.dart';

class SplashViewModel {

  final _auth = FirebaseAuth.instance;

  void splashTime(BuildContext context) {

    Future.delayed(Duration(seconds: 1), () {
      if(_auth.currentUser != null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AllProductsView()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
      }
    });

  }

}