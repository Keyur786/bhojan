import 'package:bhojan/blocs/wishlist/wishlist_event.dart';
import 'package:bhojan/blocs/wishlist/wishlist_state.dart';
import 'package:bhojan/models/wishlist_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());
  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistProductToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapAddWishlistProductToState(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapRemoveWishlistProductToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistProductToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddWishlistProductToState(
      AddWishlistProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishlist: Wishlist(
                products:
                    List.from(state.wishlist.products)..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishlistProductToState(
      RemoveWishlistProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishlist: Wishlist(
                products:
                    List.from(state.wishlist.products)..remove(event.product)));
      } catch (_) {}
    }
  }
}
