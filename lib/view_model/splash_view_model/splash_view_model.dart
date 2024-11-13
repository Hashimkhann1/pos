import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos/view/authentication/login_view.dart';
import 'package:pos/view_model/get_store_data_view_model/get_store_data_view_model.dart';

import '../../view/branch/sale_invoice/sale_invoice_view.dart';

class SplashViewModel {

  final _auth = FirebaseAuth.instance;

  void splashTime(BuildContext context) {

    Future.delayed(Duration(seconds: 1), () {
      if(_auth.currentUser != null){
        GetStoreDataViewModel().getStoreData(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => SaleInvoiceView()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
      }
    });

  }

}