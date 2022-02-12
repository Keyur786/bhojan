import 'package:bhojan/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
