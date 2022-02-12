import 'package:bhojan/blocs/category/category_bloc.dart';
import 'package:bhojan/blocs/product/product_bloc.dart';
import 'package:bhojan/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Shimmer.fromColors(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Food Corner",
                    style: GoogleFonts.redHatDisplay(
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.search,
                      size: 28,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          baseColor: Colors.white,
          highlightColor: Colors.grey,
        ),
      ),
      bottomNavigationBar: const CustomNavBar(
        screen: routeName,
      ),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                const Center(child: CircularProgressIndicator());
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: state.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                );
              } else {
                return const Text("Something went wrong");
              }
            },
          ),
          const SectionTitle(title: "RECOMMANDED"),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isRecommended)
                      .toList(),
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const SectionTitle(title: "MOST POPULAR"),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList());
              } else {
                return const Text("Something went Wrong");
              }
            },
          ),
        ],
      ),
    );
  }
}
