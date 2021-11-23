import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistDefault()) {
    on<StartWishlist>(_wishListLoad);
    on<AddWishlistProduct>(
        (event, CartState) => _WishlistProductAddedToState(event, state));
    on<RemoveWishlistProduct>(
        (event, CartState) => _WishlistProductRemovedToState(event, state));
  }

  Future<void> _wishListLoad(
      StartWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(
        WishlistLoaded(),
      );
    } catch (_) {}
  }

  Future<void> _WishlistProductAddedToState(
      AddWishlistProduct event, WishlistState state) async {
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  Future<void> _WishlistProductRemovedToState(
      RemoveWishlistProduct event, WishlistState state) async {
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
