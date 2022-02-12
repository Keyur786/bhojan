import 'package:bhojan/blocs/wishlist/wishlist_bloc.dart';
import 'package:bhojan/blocs/wishlist/wishlist_state.dart';
import 'package:bhojan/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishlistScreen(),
    );
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Wishlist"),
        bottomNavigationBar: const CustomNavBar(screen: routeName),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WishlistLoaded) {
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.4),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: WishlistCard(
                      product: state.wishlist.products[index],
                      widthFactor: 1.1,
                      isWishlist: true,
                    ),
                  );
                },
              );
            } else {
              return const Text("Something went wrong");
            }
          },
        ));
  }
}
