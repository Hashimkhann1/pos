



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';
import 'package:pos/view_model/bloc/loading_bloc/loading_bloc_event/loading_bloc_event.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_bloc/store_data_bloc.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_event/store_data_event.dart';

class AddCategoryViewModel {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('stores');


  // add product category to firebase
  Future<void> addCategory(BuildContext context , String categoryName) async {
    context.read<LoadingBloc>().add(SetLoading());
    try{
      await _firestore.doc(_auth.currentUser!.uid.toString()).update({
        'productsCategory': FieldValue.arrayUnion([categoryName.toString()])
      }).then((value) {

        context.read<LoadingBloc>().add(SetLoading());
        context.read<StoreDataBloc>().add(AddCategory(categoryName: categoryName));

      });
    }catch(error){
      context.read<LoadingBloc>().add(SetLoading());
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
        context.read<StoreDataBloc>().add(RemoveCategory(categoryName: categoryName));
      });
    }catch(error){
      if(kDebugMode){
        print("Error while Removing Category from AddCategoryViewModel $error");
      }
    }
  }

}