import 'package:cloud_firestore/cloud_firestore.dart';

class SizeModel {
  final String id;
  final String name;

  SizeModel({required this.id, required this.name});

  factory SizeModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return SizeModel(
      id: doc.id,
      name: doc['name'],
    );
  }
}
