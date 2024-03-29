import 'package:bhojan/models/models.dart';
import 'package:bhojan/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:bhojan/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
case OrderConfirmation.routeName:
        return OrderConfirmation.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);

      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/error"),
        builder: (_) => Scaffold(appBar: AppBar(title: const Text("Error"))));
  }
}
