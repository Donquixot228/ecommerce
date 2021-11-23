import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    required this.product,
    Key? key,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: product,
        );
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 145,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 70,
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor - 10,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: leftPosition + 5,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor - 45,
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
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is CartLoaded) {
                        return Expanded(
                          child: IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(CartProductAdded(product));
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        );
                      } else {
                        return Text('Something went wrong');
                      }
                    },
                  ),
                  isWishlist
                      ? Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
