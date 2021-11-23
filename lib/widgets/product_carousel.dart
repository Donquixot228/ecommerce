
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          itemCount: products.length
          ,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: ProductCard(product: products[index]),
        );
      }),
    );
  }
}

