import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CheckoutNavbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CUSTOMER INFORMATION",
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
            ),
            _buildTextFormField(emailController, context, "Email"),
            _buildTextFormField(nameController, context, "Full Name"),
            Text(
              "DELIVERY INFORMATION",
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
            ),
            _buildTextFormField(addressController, context, "Address"),
            _buildTextFormField(cityController, context, "City"),
            _buildTextFormField(countryController, context, "Country"),
            _buildTextFormField(zipController, context, "Zip Code"),
            Text(
              "ORDER SUMMARY",
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
            ),
            OrderSummery(),
          ],
        ),
      ),
    );
  }


  Padding _buildTextFormField(TextEditingController controller,
      BuildContext context, String labelText) {
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
              controller: controller,
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
