import 'package:bhojan/models/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
   const CartState();
  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final Cart cart;
   const CartLoaded({
    this.cart = const Cart(),
  });
  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
