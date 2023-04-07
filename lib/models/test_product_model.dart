// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class TestProduct{
  final name;
  final id;

  TestProduct(this.name, this.id);

  static TestProduct fromJson(
    Map<String, dynamic> json, String id) {
    return TestProduct(
      json['name'],
      json['id'] = id,
    );
  }
  




}