import 'package:bhojan/blocs/cart/cart_bloc.dart';
import 'package:bhojan/blocs/cart/cart_event.dart';
import 'package:bhojan/blocs/wishlist/wishlist_bloc.dart';
import 'package:bhojan/blocs/wishlist/wishlist_event.dart';
import 'package:bhojan/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class WishlistCard extends StatelessWidget {
  final Product product;
  final double widthFactor;

  final bool isWishlist;
  const WishlistCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
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
            // Positioned(
            //     bottom: 1.5,
            //     right: 5,
            //     child: Container(
            //       width: MediaQuery.of(context).size.width / 1.9,
            //       height: 50,
            //       decoration: BoxDecoration(
            //           color: Colors.deepOrange.withAlpha(80),
            //           borderRadius: BorderRadius.circular(8)),
            //     )),
            Positioned(
                bottom: 5,
                right: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
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
                      Expanded(
                        child: IconButton(
                          alignment: Alignment.centerRight,
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductAdded(product));

                            const snackBar = SnackBar(
                                content: Text(
                              "Added to your Cart",
                            ));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                      ),
                      isWishlist
                          ? Expanded(
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                icon: const Icon(Icons.delete,
                                    color: Colors.white),
                                onPressed: () {
                                  context
                                      .read<WishlistBloc>()
                                      .add(RemoveWishlistProduct(product));
                                },
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
