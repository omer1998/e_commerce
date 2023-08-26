import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/firestore_service.dart';

import '../models/test_product_model.dart';

abstract class Database {
  Stream<List<Product>> saleProductStream();

  Stream<List<Product>> newProductStream();
}

class FirestoreDatabase extends Database {
  final String userId;
  FirestoreDatabase({required this.userId});
  final MyFirestore _firestore = MyFirestore.instance;

  @override
  Stream<List<Product>> saleProductStream() {
    return _firestore.collectionStream(
        fromMap: (data, id) => Product.fromMap(data, id),
        collecPath: "products/",
        query:(query) => query.where("rate", isGreaterThan: 0.0),
        );
  }
  
  @override
  Stream<List<Product>> newProductStream() {
    return _firestore.collectionStream(collecPath: "products/", fromMap: (data, id) =>  Product.fromMap(data, id));
  }
}
