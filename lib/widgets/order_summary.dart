import 'package:bhojan/blocs/cart/cart_bloc.dart';
import 'package:bhojan/blocs/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
            children: [
              const Divider(thickness: 2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SUBTOTAL",
                            style: Theme.of(context).textTheme.headline3),
                        Text("\$${state.cart.subtotalString}",
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("FREE DELIVERY",
                            style: Theme.of(context).textTheme.headline3),
                        Text("\$${state.cart.deliveryFeeString}",
                            style: Theme.of(context).textTheme.headline3)
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
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          );
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }
}
