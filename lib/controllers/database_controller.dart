import 'package:e_commerce/services/firestore_service.dart';

import '../models/test_product_model.dart';

abstract class Database{
    Stream <List<TestProduct>> productStrem(String collecPath, Function(Map<String, dynamic>, String docId) builder);
}

class FirestoreDatabase implements Database{
  final MyFirestore _firestore = MyFirestore.instance;

  @override
  Stream<List<TestProduct>> productStrem(String collecPath, Function(Map<String, dynamic> p1, String docId) builder) {
    return _firestore.collectionStream(collecPath, (data, docId) => TestProduct.fromJson(data, docId));
  }

}