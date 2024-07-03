// ignore_for_file: non_constant_identifier_names

import 'package:chapa_admin/utils/parser_util.dart';
import 'package:equatable/equatable.dart';

import 'review_model.dart';

class SubCategoriesModel extends Equatable {
  final String id;
  final String name;
  final String cat_id;
  final List<String> color;
  final List<String> images;
  final List<String> size;
  final String specifications;
  final String description;
  final String added;
  final String higher_price;
  final String lower_price;
  final String design_price;
  final List<ReviewModel> reviews;

  const SubCategoriesModel({
    this.id = "",
    this.name = "",
    this.cat_id = "",
    this.color = const [],
    this.images = const [],
    this.size = const [],
    this.specifications = "",
    this.description = "",
    this.added = "",
    this.higher_price = "",
    this.lower_price = "",
    this.design_price = "",
    this.reviews = const [],
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    final data = Map<String, dynamic>.from(json);
    return SubCategoriesModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      cat_id: json['cat_id'] ?? "",
      added: json['added'] ?? "",
      higher_price: json['higher_price'] ?? "",
      lower_price: json['lower_price'] ?? "",
      design_price: json['design_price'] ?? "",
      color: json['color'] == null
          ? []
          : (json['color'] as List<dynamic>)
              .map((e) => e?.toString() ?? "")
              .toList(),
      size: json['size'] == null
          ? []
          : (json['size'] as List<dynamic>)
              .map((e) => e?.toString() ?? "")
              .toList(),
      specifications: json['specifications'] ?? "",
      images: json['images'] == null
          ? []
          : (json['images'] as List<dynamic>)
              .map((e) => e?.toString() ?? "")
              .toList(),
      reviews: json['reviews'] == null
          ? []
          : ParserUtil<ReviewModel>().parseJsonList(
              json: data['reviews'],
              fromJson: (e) => ReviewModel.fromJson(e),
            ),
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        cat_id,
        description,
        images,
        color,
        size,
        specifications,
        added,
        reviews,
        higher_price,
        lower_price,
        design_price,
      ];
}
