import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist',),
      bottomNavigationBar: CustomNavBarr(),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 11),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2.4,
          ),
          itemCount: Product.products.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(widthFactor: 1.5,
                leftPosition: 25,
                isWishlist: true,
                product: Product.products[index],
              ),
            );
          }),
    );
  }
}
