import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool inStock;
  final bool isPopular;
  double price;
  int quantity;
  Product({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.inStock,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });
  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      inStock,
      isPopular,
      price,
      quantity,
    ];
  }

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? inStock,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      inStock: inStock ?? this.inStock,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};

  //   result.addAll({'name': name});
  //   result.addAll({'category': category});
  //   result.addAll({'description': description});
  //   result.addAll({'imageUrl': imageUrl});
  //   result.addAll({'inStock': inStock});
  //   result.addAll({'isPopular': isPopular});
  //   result.addAll({'price': price});
  //   result.addAll({'quantity': quantity});

  //   return result;
  // }
  Map<String, dynamic> toMap() {
    final docProduct = FirebaseFirestore.instance.collection("products").doc();

    return {
      'id': docProduct.id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'inStock': inStock,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    final docProduct = FirebaseFirestore.instance.collection("products").doc();

    return Product(
      // id: snap.id,
      id: docProduct.id,
      name: snap['name'] ?? '',
      category: snap['category'] ?? '',
      description: snap['description'] ?? '',
      imageUrl: snap['imageUrl'] ?? '',
      inStock: snap['inStock'] ?? false,
      isPopular: snap['isPopular'] ?? false,
      price: snap['price']?.toDouble() ?? 0.0,
      quantity: snap['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Product(id: $id, name: $name, category: $category, description: $description, imageUrl: $imageUrl, inStock: $inStock, isPopular: $isPopular, price: $price, quantity: $quantity,),';
  }

  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
      id: "1",
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      description:
          "They can be used for e-commerce websites and repurposed for catalogs and social media marketing purposes.",
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 2.99,
      inStock: true,
      isPopular: false,
      quantity: 3,
    ),
    Product(
      id: "2",
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      description:
          "They can be used for e-commerce websites and repurposed for catalogs and social media marketing purposes.",
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      price: 2.99,
      inStock: false,
      isPopular: true,
      quantity: 3,
    ),
    Product(
      id: "3",
      name: 'Soft Drink #3',
      category: 'Soft Drinks',
      description:
          "They can be used for e-commerce websites and repurposed for catalogs and social media marketing purposes.",
      imageUrl:
          'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2.99,
      inStock: true,
      isPopular: true,
      quantity: 3,
    ),
  ];
}
