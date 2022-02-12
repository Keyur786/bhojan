import 'package:bhojan/models/category_model.dart';
import 'package:bhojan/models/product_model.dart';
import 'package:bhojan/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: const CustomNavBar(screen: routeName),
        body: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 2.4),
            itemCount: categoryProduct.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: WishlistCard(
                  product: categoryProduct[index],
                  widthFactor: 1.1,
                ),
              );
            }));
  }
}
