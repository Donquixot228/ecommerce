
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 145,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          top: 70,
          left: 30,

          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
            ),
          ),
        ),
        Positioned(
          top: 75,
          left: 40,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 45,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 10),
                      ),
                      Text(
                        "\$${product.price}",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Expanded(

                  child: IconButton(

                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}