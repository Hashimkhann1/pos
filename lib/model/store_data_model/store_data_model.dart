import 'package:cloud_firestore/cloud_firestore.dart';

class StoreDataModel {
  DateTime? createdData;
  String? storeEmail;
  String? storeId;
  String? storeName;
  List<String>? productsCategory;

  StoreDataModel({
    this.createdData,
    this.storeEmail,
    this.storeId,
    this.storeName,
    this.productsCategory,
  });

  StoreDataModel.fromJson(Map<String, dynamic> json) {
    createdData = (json['createdData'] as Timestamp).toDate();
    storeEmail = json['storeEmail'];
    storeId = json['storeId'];
    storeName = json['storeName'];
    productsCategory = json['productsCategory'] != null
        ? List<String>.from(json['productsCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdData'] = createdData;
    data['storeEmail'] = storeEmail;
    data['storeId'] = storeId;
    data['storeName'] = storeName;
    if (productsCategory != null) {
      data['productsCategory'] = productsCategory;
    }
    return data;
  }
}
