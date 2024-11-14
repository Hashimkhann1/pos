import 'package:equatable/equatable.dart';
import 'package:pos/model/store_data_model/store_data_model.dart';

class StoreDataState extends Equatable {
  final List<StoreDataModel> storeData;
  final List<String> categoriesList;

  const StoreDataState({this.storeData = const [] , this.categoriesList = const []});

  StoreDataState copyWith({List<StoreDataModel>? storeData , List<String>? categoriesList}) {
    return StoreDataState(
      storeData: storeData ?? this.storeData,
      categoriesList: categoriesList ?? this.categoriesList,
    );
  }

  @override
  List<Object> get props => [storeData , categoriesList];
}
