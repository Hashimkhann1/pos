


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/model/store_data_model/store_data_model.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_bloc/store_data_bloc.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_event/store_data_event.dart';

class GetStoreDataViewModel {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('stores');


  // Get store Data
  Future<void> getStoreData(BuildContext context) async {
    try{
      DocumentSnapshot<Map<String, dynamic>> data = await _firestore.doc(_auth.currentUser!.uid.toString()).get();

      if(data.data() != null) {

        // Adding data to model
        StoreDataModel storeData = await StoreDataModel.fromJson(data.data()!);

        context.read<StoreDataBloc>().add(AllStoreData(storeDataModel: storeData));
        // context.read<StoreDataBloc>().add(GetALlCategory(categoriesList: storeData.productsCategory));

      }
    }catch(error){
      if(kDebugMode){
        print("Error while getting user data from GetUserDataViewModel >>>>>>> $error");
      }
    }
  }
}