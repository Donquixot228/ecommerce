import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartDefault()) {
    on<CartStarted>(_cartStartLoad);
    on<CartProductAdded>(
        (event, CartState) => _CartProductAddedToState(event, state));
    on<CartProductRemoved>(
            (event, CartState) => _CartProductRemovedToState(event, state));
  }

  Future<void> _cartStartLoad(
      CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(
        CartLoaded(),
      );
    } catch (_) {}
  }

  Future<void> _CartProductAddedToState(
      CartProductAdded event, CartState state) async {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
  Future<void> _CartProductRemovedToState(
      CartProductRemoved event, CartState state) async {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }


}
