import 'package:flutter/material.dart';

class CustomNavBarr extends StatelessWidget {
  const CustomNavBarr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        color: Colors.black,
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
