import 'package:ecommerce/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (contex) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CheckoutNavbar(),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CUSTOMER INFORMATION",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 20),
                    ),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(
                          email:
                              value)); //все остальнве в апдейте 0 так как нулебл
                    }, context, "Email"),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(
                          fullName:
                              value)); //все остальнве в апдейте 0 так как нулебл
                    }, context, "Full Name"),
                    Text(
                      "DELIVERY INFORMATION",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 20),
                    ),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(
                          address:
                              value)); //все остальнве в апдейте 0 так как нулебл
                    }, context, "Address"),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(
                          city:
                              value)); //все остальнве в апдейте 0 так как нулебл
                    }, context, "City"),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(
                          country:
                              value)); //все остальнве в апдейте 0 так как нулебл
                    }, context, "Country"),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(
                          zipCode:
                              value)); //все остальнве в апдейте 0 так как нулебл
                    }, context, "Zip Code"),
                    Text(
                      "ORDER SUMMARY",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 20),
                    ),
                    OrderSummery(),
                  ],
                );
              } else {
                return Text('Something went wrong ');
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
