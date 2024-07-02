// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String id;
  final String name;
  final String url;
  final String added;

  const CategoriesModel({
    this.id = "",
    this.name = "",
    this.url = "",
    this.added = "",
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      url: json['url'] ?? "",
      added: json['added'] ?? "",
    );
  }
  @override
  List<Object?> get props => [id, name, url, added];
}
