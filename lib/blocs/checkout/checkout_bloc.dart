import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/repositories/checkout_repository/checkout_repository.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;

  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString,
              )
            : CheckoutInitial()) {
    on<UpdateCheckout>(
        (event, CheckoutState) => _updateCheckoutToState(event, state));
    on<ConfirmCheckout>(
        (event, CheckoutState) => _confirmedCheckoutToState(event, state));
  }

  Future<void> _updateCheckoutToState(
      UpdateCheckout event, CheckoutState state) async {
    if (state is CheckoutLoaded) {
      try {
        emit(
          CheckoutLoaded(
            email: event.email ?? state.email,
            products: event.cart?.products ?? state.products,
            deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
            subtotal: event.cart?.subtotalString ?? state.subtotal,
            address: event.address ?? state.address,
            city: event.city ?? state.city,
            country: event.country ?? state.country,
            zipCode: event.zipCode ?? state.zipCode,
          ),
        );
      } catch (_) {}
    }
  }

  Future<void> _confirmedCheckoutToState(
      ConfirmCheckout event, CheckoutState state) async {
    if (state is CheckoutLoaded) {
      _checkoutRepository.addCheckout(event.checkout);

      emit(CheckoutInitial());
      log('Done');
    }
  }
}
