import 'package:ecommerce/blocs/checkout/checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutNavbar extends StatelessWidget {
  const CheckoutNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(300)),
          color: Colors.black,
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black.withAlpha(50),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return ElevatedButton(
                onPressed: () {
                  context
                      .read<CheckoutBloc>()
                      .add(ConfirmCheckout(checkout: state.checkout));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, elevation: 5),
                child: Text(
                  'Order Now',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 25, color: Colors.black),
                ),
              );
            } else {
              return Text("Something went wrong");
            }
          },
        ),
      ),
    );
  }
}
