import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarProduct extends StatelessWidget {
  const NavBarProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read<WishlistBloc>().add(AddWishlistProduct(product));
                  final snackBar = SnackBar(
                    content: Text('Added to your favorite'),
                    duration: Duration(seconds: 1),
                    action: SnackBarAction(
                      label: '',
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: Colors.blue,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                },
              );
            },
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(product));
                  Navigator.pushNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 25, color: Colors.black),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
