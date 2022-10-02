import 'package:last_try/models/checkout_model.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}
