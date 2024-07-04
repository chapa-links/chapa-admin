// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  final String id;
  final String name;
  final String url;
  final String design_price;
  final String added;

  CategoriesModel(
      {required this.id,
      required this.name,
      required this.url,
      required this.design_price,
      required this.added});

  factory CategoriesModel.fromDocumentSnapshot(DocumentSnapshot json) {
    // print(json.id);
    return CategoriesModel(
      id: json.id,
      name: json['name'],
      url: json['url'],
      design_price: json['design_price'],
      added: json['added'],
    );
  }
}
