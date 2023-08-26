// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final String category;
  final int? discountValue;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.category = "Others", // this is optional parameter if the user didn't pass it we will use the default value which is "others"
    this.discountValue,
    this.rate,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'category': category,
      'discountValue': discountValue,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String id) {
    return Product(
      id: id,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      category: map['category'] as String,
      discountValue: map['discountValue'] != null ? map['discountValue'] as int : null,
      rate: map['rate'] ,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<Product> dummyProductList = [
  Product(id: "3", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
  Product(id: "4", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
  Product(id: "5", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
  Product(id: "6", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
  Product(id: "7", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
  Product(id: "8", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
  Product(id: "9", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
  Product(id: "10", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
  Product(id: "11", title: "T shirt", price: 300, imgUrl: AppAssets.productImageAsset, discountValue: 10),
];