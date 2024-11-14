


import 'package:bloc/bloc.dart';
import 'package:pos/model/store_data_model/store_data_model.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_event/store_data_event.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_state/store_data_state.dart';

class StoreDataBloc extends Bloc<StoreDataEvent , StoreDataState> {

  List<StoreDataModel> storeData = [];
  List<String> allCategories = [];


  StoreDataBloc() : super(StoreDataState()) {
    on<AllStoreData>(_allStoreData);
    on<AddCategory>(_addCategory);
    on<RemoveCategory>(_removeCategory);
  }

  void _allStoreData(AllStoreData event , Emitter<StoreDataState> emit) {
    storeData.add(event.storeDataModel);
    emit(state.copyWith(storeData: List.from(storeData)));
  }

  void _getALlCategory() {

  }

  /// add category
  void _addCategory(AddCategory event, Emitter<StoreDataState> emit) {

    allCategories = state.storeData[0].productsCategory!;
    storeData[0].productsCategory = allCategories;

    // i will work on it tomorrow

    emit(state.copyWith(storeData: List.from(storeData))); // This should trigger rebuilds
  }

  /// remove category
  void _removeCategory(RemoveCategory event, Emitter<StoreDataState> emit) {
    storeData[0].productsCategory!.remove(event.categoryName);
    emit(state.copyWith(storeData: List.from(storeData))); // This should trigger rebuilds
  }


}