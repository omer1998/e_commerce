import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class MyFirestore {
  MyFirestore._singlton();
  static MyFirestore instance = MyFirestore._singlton();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> setData(String path, Map<String, dynamic> data) async {
    final refernece = _firestore.doc(
        path); // this refernece to specific document as i save data in document not in collection
    return refernece.set(data);
  }

  Future<void> deleteData(String path) async {
    // the path here is to specific document, to delet it
    return _firestore.doc(path).delete();
  }

  Stream<T> documentStream<T>(String docPath,
      T Function(Map<String, dynamic> data, String documentId) builder) {
    final refernece = _firestore.doc(docPath);
    final data = refernece
        .snapshots()
        .map((snapshot) => builder(snapshot.data()!, snapshot.id));
    return data;
  }


  Stream<List<T>> collectionStream<T>(
    String collecPath,
    T Function(Map<String, dynamic> data, String docId) builder
  ){
      final collectionReference = _firestore.collection(collecPath);
      final data = collectionReference.snapshots().map((snapshot) => snapshot.docs.map((doc) => builder(doc.data(), doc.id)).toList());
      return data;
  }
      
  } 

  
//   static final MyFirestore _instance = MyFirestore._internal();
//   factory MyFirestore() => _instance;
//   MyFirestore._internal();

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> addProduct(Product product) async {
//     await _firestore.collection('products').add(product.toMap());
//   }

//   Future<void> updateProduct(Product product) async {
//     await _firestore
//         .collection('products')
//         .doc(product.id)
//         .update(product.toMap());
//   }

//   Future<void> deleteProduct(Product product) async {
//     await _firestore.collection('products').doc(product.id).delete();
//   }

//   Future<List<Product>> getProducts() async {
//     final QuerySnapshot snapshot =
//         await _firestore.collection('products').get();
//     final List<Product> products = [];
//     snapshot.docs.forEach((doc) {
//       products.add(Product.fromMap(doc.data()));
//     });
//     return products;
//   }
