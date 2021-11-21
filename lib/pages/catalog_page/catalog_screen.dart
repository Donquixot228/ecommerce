import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;

  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> _categoryProducts = Product.products.where((product)=> product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: CustomNavBarr(),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 11),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemCount: _categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(widthFactor: 2.2,
                product: _categoryProducts[index],
              ),
            );
          }),
    );
  }
}
