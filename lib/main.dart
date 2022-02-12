import 'package:bhojan/blocs/cart/cart_bloc.dart';
import 'package:bhojan/blocs/cart/cart_event.dart';
import 'package:bhojan/blocs/category/category_bloc.dart';
import 'package:bhojan/blocs/checkout/checkout_bloc.dart';
import 'package:bhojan/blocs/product/product_bloc.dart';
import 'package:bhojan/blocs/wishlist/wishlist_bloc.dart';
import 'package:bhojan/blocs/wishlist/wishlist_event.dart';
import 'package:bhojan/config/app_router.dart';
import 'package:bhojan/config/theme.dart';
import 'package:bhojan/repositories/category/category_repository.dart';
import 'package:bhojan/repositories/checkout/checkout_repository.dart';
import 'package:bhojan/repositories/product/product_repository.dart';
import 'package:bhojan/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/cart/cart_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bhojan',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
        home: const HomeScreen(),
      ),
    );
  }
}
