import 'package:last_try/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
