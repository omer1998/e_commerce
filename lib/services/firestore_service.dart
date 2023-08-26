
import 'package:cloud_firestore/cloud_firestore.dart';

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
    // the path here is to specific document, to delete it
    return _firestore.doc(path).delete();
  }

// this function responsible of returning stream of collection inside a document ??
  Stream<T> documentStream<T>(String docPath,
      T Function(Map<String, dynamic> data, String documentId) fromMap) {
    final refernece = _firestore.doc(docPath);
    final data = refernece
        .snapshots()
        .map((snapshot) => fromMap(snapshot.data()!, snapshot.id));
    return data;
  }

// to return stream of docs inside collections
  Stream<List<T>> collectionStream<T>(
      {required String collecPath,
      required T Function(Map<String, dynamic> data, String docId) fromMap,
      Query Function(Query query)? query,
      Function(T left, T right)? sort}) {
    Query collectionReference = _firestore.collection(collecPath);

    // final data = collectionReference.snapshots().map((snapshot) =>
    //     snapshot.docs.map((doc) => fromMap(doc.data(), doc.id)).toList());
    if (query != null) {
      collectionReference = query(collectionReference);
    }
    var resultData = collectionReference.snapshots().map((snapshot) => snapshot.docs  //this a snapshot of this collection which contain docs
        .map((document) => fromMap(document.data() as Map<String, dynamic>  , document.id))   // now wen need to map each document's data which is the product into its model
        .toList());

        if(sort != null){
        }
    return resultData;
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
