import 'package:bhojan/blocs/cart/cart_bloc.dart';
import 'package:bhojan/blocs/cart/cart_state.dart';
import 'package:bhojan/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Cart"),
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepOrange,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/checkout");
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    child: Text("GO TO CHECKOUT",
                        style: Theme.of(context).textTheme.headline3))
              ],
            ),
          ),
        ),
        body: 
             BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CartLoaded) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.cart.freeDeliveryString,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepOrange)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/");
                                },
                                child: Text("Add Items",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                                itemCount: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .length,
                                itemBuilder: (context, index) {
                                  return CartProductCard(
                                      quantity: state.cart
                                          .productQuantity(state.cart.products)
                                          .values
                                          .elementAt(index),
                                      product: state.cart
                                          .productQuantity(state.cart.products)
                                          .keys
                                          .elementAt(index));
                                }),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("SUBTOTAL",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    Text("\$${state.cart.subtotalString}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("FREE DELIVERY",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    Text("\$${state.cart.deliveryFeeString}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.deepOrange.withAlpha(80)),
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.deepOrange),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("TOTAL",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(color: Colors.white)),
                                      Text("\$${state.cart.totalString}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(color: Colors.white))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Text("Something Went Wrong");
              }
            }));
  }
}
