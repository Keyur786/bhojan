import 'package:bhojan/models/checkout_model.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}