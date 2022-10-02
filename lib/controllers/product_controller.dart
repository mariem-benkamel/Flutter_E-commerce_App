import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/product_model.dart';
import '../services/database_service.dart';

class ProductController extends GetxController {
  final DatabaseService database = DatabaseService();
  var products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(database.getProducts());
    super.onInit();
  }

  var newProduct = {}.obs;
  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get inStock => newProduct['inStock'];
  get imageUrl => newProduct['imageUrl'];
  get isPopular => newProduct['isPopular'];

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void saveNewProductPrice(
    Product product,
    String field,
    double value,
  ) {
    database.updateField(product, field, value);
  }

  void saveNewProductQuantity(
    Product product,
    String field,
    int value,
  ) {
    database.updateField(product, field, value);
  }

  void updateProductQuantity(
    int index,
    Product product,
    int value,
  ) {
    product.quantity = value;
    products[index] = product;
  }

  void saveNewProductStock(
    Product product,
    String field,
    bool value,
  ) {
    database.updateField(product, field, value);
  }

  void updateProductStock(
    int index,
    Product product,
    int value,
  ) {
    product.quantity = value;
    products[index] = product;
  }
}
