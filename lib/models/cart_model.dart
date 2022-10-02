import 'package:equatable/equatable.dart';
import 'package:last_try/models/models.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({
    this.products = const <Product>[],
  });

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = Map();
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 100) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 100.0) {
      return 'You have free delivery ';
    } else {
      double missing = 100.0 - subtotal;

      return "Add ${missing.toStringAsFixed(2)} For free delivery ";
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
}
