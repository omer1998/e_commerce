import 'package:e_commerce/models/test_product_model.dart';
import 'package:e_commerce/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FirestoreController{
  final MyFirestore firestore = MyFirestore.instance;


 // singlton

  setData(String path,Map<String, dynamic> data){
    firestore.setData(path, data);
  }

  deleteData(String path){
    firestore.deleteData(path);
  }

  Stream<T> documentStream<T>({required String docPath,required T Function(Map<String, dynamic> data, String documentId) builder}){
    return firestore.documentStream(docPath, builder);
  }

  Stream<List<T>> collectionStream<T>({
    required String collectionPath,
    required T Function(Map<String, dynamic> data, String docId) builder
  }){
    return firestore.collectionStream(collecPath: collectionPath, fromMap: (data, docId) => 
    builder(data, docId)
    );
  }

}