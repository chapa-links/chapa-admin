// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String id;
  final String name;
  final String url;
  final String design_price;
  final String added;

  const CategoriesModel({
    this.id = "",
    this.name = "",
    this.url = "",
    this.design_price = "",
    this.added = "",
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      url: json['url'] ?? "",
      design_price: json['design_price'] ?? "",
      added: json['added'] ?? "",
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        url,
        design_price,
        added,
      ];
}
