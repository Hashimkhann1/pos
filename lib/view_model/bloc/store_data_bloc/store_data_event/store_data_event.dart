


import 'package:equatable/equatable.dart';
import 'package:pos/model/store_data_model/store_data_model.dart';

class StoreDataEvent extends Equatable {


  @override
  List<Object?> get props => [];


}

/// All Store data 
class AllStoreData extends StoreDataEvent {
  final StoreDataModel storeDataModel;
  AllStoreData({required this.storeDataModel});
}

class GetALlCategory extends StoreDataEvent {
  final List<String> categoriesList;
  GetALlCategory({required this.categoriesList});
}

/// Add Category
class AddCategory extends StoreDataEvent {
  final String categoryName;
  AddCategory({required this.categoryName});
}

/// Remove Category
class RemoveCategory extends StoreDataEvent {
  final String categoryName;
  RemoveCategory({required this.categoryName});
}
