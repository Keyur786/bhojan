import 'package:bhojan/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepOrange[600],
      child: SizedBox(
        height: 70,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _selectNavBar(context, screen)!),
      ),
    );
  }
}

List<Widget>? _selectNavBar(context, screen) {
  switch (screen) {
    case '/':
      return _buildNavBar(context);
    case '/catalog':
      return _buildNavBar(context);
    case '/wishlist':
      return _buildNavBar(context);
    case '/order-confirmation':
      return _buildNavBar(context);

    default:
      _buildNavBar(context);
  }
}

List<Widget> _buildNavBar(context) {
  return [
    IconButton(
      icon: const Icon(Icons.home, color: Colors.white),
      onPressed: () {
        Navigator.pushNamed(context, "/");
      },
    ),
    IconButton(
      icon: const Icon(Icons.shopping_cart, color: Colors.white),
      onPressed: () {
        Navigator.pushNamed(context, "/cart");
      },
    ),
    IconButton(
      icon: const Icon(Icons.person, color: Colors.white),
      onPressed: () {
        Navigator.pushNamed(context, "/user");
      },
    ),
    IconButton(
      icon: const Icon(Icons.favorite, color: Colors.white),
      onPressed: () {
        Navigator.pushNamed(context, "/wishlist");
      },
    )
  ];
}
