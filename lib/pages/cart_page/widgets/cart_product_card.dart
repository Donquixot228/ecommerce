import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemoved(product));
                      }),
                  Text(
                    '$quantity',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 20),
                  ),
                  IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductAdded(product));
                      }),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
