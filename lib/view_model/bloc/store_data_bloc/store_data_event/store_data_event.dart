


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