import 'package:bhojan/blocs/cart/cart_bloc.dart';
import 'package:bhojan/blocs/cart/cart_event.dart';
import 'package:bhojan/blocs/cart/cart_state.dart';
import 'package:bhojan/blocs/wishlist/wishlist_bloc.dart';
import 'package:bhojan/blocs/wishlist/wishlist_event.dart';
import 'package:bhojan/blocs/wishlist/wishlist_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bhojan/models/models.dart';
import 'package:bhojan/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepOrange,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                BlocBuilder<WishlistBloc, WishlistState>(
                    builder: (context, state) {
                  return IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddWishlistProduct(product));
                      const snackBar =
                          SnackBar(content: Text("Added to your Wishlist"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  );
                }),
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                        Navigator.pushNamed(context, "/cart");
                        const snackBar =
                            SnackBar(content: Text("Added to your Cart"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      child: Text("ADD TO CART",
                          style: Theme.of(context).textTheme.headline3));
                })
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: [HeroCarouselCard(product: product)]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.deepOrange.withAlpha(80),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.deepOrange),
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '₹${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text("Product Information",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                children: [
                  ListTile(
                    title: Text(
                      product.desc,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                title: Text("Delivery Information",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                children: [
                  ListTile(
                    title: Text(
                      "Dolore ullamco aliquip esse et deserunt voluptate Lorem mollit occaecat velit est dolore qui ea. Fugiat Lorem quis quis quis sit quis. Magna id magna ullamco pariatur in. Excepteur qui incididunt ipsum cillum tempor duis. Ad dolor eu qui sunt ex qui amet commodo est ipsum.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
