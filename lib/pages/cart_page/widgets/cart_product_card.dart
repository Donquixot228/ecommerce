
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final Product product;

  const CartProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 80,
            width: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 15)),
                Text('\$${product.price}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 15)),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: null,
              ),
              Text(
                '1',
                style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
              ),
              IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
