import 'package:bhojan/blocs/cart/cart_bloc.dart';
import 'package:bhojan/blocs/cart/cart_event.dart';
import 'package:bhojan/blocs/cart/cart_state.dart';
import 'package:bhojan/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({Key? key, required this.product,required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(product));
                    },
                    icon: const Icon(Icons.remove_circle)),
                Text("$quantity", style: Theme.of(context).textTheme.headline4),
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                    },
                    icon: const Icon(Icons.add_circle)),
              ],
            );
          })
        ],
      ),
    );
  }
}
