// import 'package:admin/models/models.dart';
// import 'package:admin/models/order_stats_model.dart';
// import 'package:admin/models/product_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/order_model.dart';

// class DataBaseService {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//   Stream<List<Order>> getOrders() {
//     return _firebaseFirestore.collection("orders").snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
//     });
//   }

//   Stream<List<Order>> getPendingOrders() {
//     return _firebaseFirestore
//         .collection("orders")
//         .where("isDelivered", isEqualTo: false)
//         .where("isCancelled", isEqualTo: false)
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
//     });
//   }

//   Future<List<OrderStats>> getOrderStats() {
//     return _firebaseFirestore
//         .collection("order_stats")
//         .orderBy('dateTime')
//         .get()
//         .then(
//           (querySnapshot) => querySnapshot.docs
//               .asMap()
//               .entries
//               .map((entry) => OrderStats.fromSnapshot(entry.value, entry.key))
//               .toList(),
//         );
//   }

//   Stream<List<Product>> getProducts() {
//     return _firebaseFirestore
//         .collection("products")
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
//     });
//   }

//   Future<void> addProduct(Product product) {
//     return _firebaseFirestore.collection('products').add(product.toMap());
//   }

//   Future<void> updateField(
//     Product product,
//     String field,
//     dynamic newValue,
//   ) {
//     return _firebaseFirestore
//         .collection('products')
//         .where('id', isEqualTo: product.id)
//         .get()
//         .then((querySnapshot) => {
//               querySnapshot.docs.first.reference.update({field: newValue})
//             });
//   }

//   Future<void> updateOrder(
//     Order order,
//     String field,
//     dynamic newValue,
//   ) {
//     return _firebaseFirestore
//         .collection('orders')
//         .where('id', isEqualTo: order.id)
//         .get()
//         .then((querySnapshot) => {
//               querySnapshot.docs.first.reference.update({field: newValue})
//             });
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/order_model.dart';
import '../models/order_stats_model.dart';
import '../models/product_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Order>> getPendingOrders() {
    return _firebaseFirestore
        .collection('orders')
        .where('isCancelled', isEqualTo: false)
        .where('isDelivered', isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  // Stream<List<Product>> getProducts() {
  //   return _firebaseFirestore
  //       .collection('products')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //   });
  // }

  Stream<List<Product>> getProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
    });
  }

  Future<List<OrderStats>> getOrderStats() {
    return _firebaseFirestore
        .collection('order_stats')
        .orderBy('dateTime')
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((entry) => OrderStats.fromSnapshot(entry.value, entry.key))
            .toList());
  }

  Future<void> addProduct(Product product) {
    return _firebaseFirestore.collection('products').add(product.toMap());
  }

  Future<void> updateField(
    Product product,
    String field,
    dynamic newValue,
  ) {
    return _firebaseFirestore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }

  Future<void> updateOrder(
    Order order,
    String field,
    dynamic newValue,
  ) {
    return _firebaseFirestore
        .collection('orders')
        .where('id', isEqualTo: order.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }
}
