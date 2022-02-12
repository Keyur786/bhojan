import 'package:bhojan/blocs/cart/cart_bloc.dart';
import 'package:bhojan/blocs/cart/cart_event.dart';
import 'package:bhojan/blocs/cart/cart_state.dart';
import 'package:bhojan/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  const ProductCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 0,
      this.isWishlist = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/product", arguments: product);
        },
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                bottom: 1.5,
                left: leftPosition,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(80),
                      borderRadius: BorderRadius.circular(8)),
                )),
            Positioned(
                bottom: 5,
                left: leftPosition + 5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5 - 10,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 3),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                "₹${product.price}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ]),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                        if (state is CartLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                                const snackBar = SnackBar(
                                    content: Text("Added to your Cart"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              alignment: Alignment.centerRight,
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else {
                          return const Text("Something Went Wrong");
                        }
                      }),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
