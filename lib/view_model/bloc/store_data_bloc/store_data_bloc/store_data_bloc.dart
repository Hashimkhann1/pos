


import 'package:bloc/bloc.dart';
import 'package:pos/model/store_data_model/store_data_model.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_event/store_data_event.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_state/store_data_state.dart';

class StoreDataBloc extends Bloc<StoreDataEvent , StoreDataState> {

  List<StoreDataModel> storeData = [];
  List<String> allCategories = [];


  StoreDataBloc() : super(StoreDataState()) {
    on<AllStoreData>(_allStoreData);
    on<GetALlCategory>(_getALlCategory);
    on<AddCategory>(_addCategory);
    on<RemoveCategory>(_removeCategory);
  }

  void _allStoreData(AllStoreData event , Emitter<StoreDataState> emit) {
    storeData.add(event.storeDataModel);
    emit(state.copyWith(storeData: List.from(storeData)));
  }

  /// Get All Category
  void _getALlCategory(GetALlCategory event , Emitter emit){
    allCategories = event.categoriesList;
    emit(state.copyWith(categoriesList: List.from(allCategories)));
  }

  /// add category
  void _addCategory(AddCategory event, Emitter<StoreDataState> emit) {
    allCategories.add(event.categoryName.toString());
    emit(state.copyWith(categoriesList: List.from(allCategories)));
  }

  /// remove category
  void _removeCategory(RemoveCategory event, Emitter<StoreDataState> emit) {
    allCategories.remove(event.categoryName);
    emit(state.copyWith(categoriesList: List.from(allCategories))); // This should trigger rebuilds
  }


}