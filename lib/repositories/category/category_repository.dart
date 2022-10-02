import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:last_try/models/category_model.dart';

import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  // @override
  // Stream<List<Category>> getAllCategories() {
  //   return _firebaseFirestore
  //       .collection("categories")
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
  //   });
  // }
  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection("categories")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList();
    });
  }
}
