// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String id;
  final String added;
  final String updated_at;
  final String product_id;
  final String user_name;
  final String rating;
  final String comment;

  const ReviewModel({
    this.id = "",
    this.added = "",
    this.updated_at = "",
    this.product_id = "",
    this.user_name = "",
    this.rating = "",
    this.comment = "",
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? "",
      added: json['added'] ?? "",
      updated_at: json['updated_at'] ?? "",
      product_id: json['product_id'] ?? "",
      user_name: json['name'] ?? "",
      rating: json['rating'] ?? "",
      comment: json['comment'] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        id,
        added,
        updated_at,
        product_id,
        user_name,
        rating,
        comment,
      ];
}
