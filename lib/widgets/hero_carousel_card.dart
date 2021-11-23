import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? categoty;
  final Product? product;

  const HeroCarouselCard({this.categoty, this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.product == null) {
          Navigator.pushNamed(
            context,
            '/catalog',
            arguments: categoty,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                product == null ? categoty!.imaheUrl : product!.imageUrl,
                width: 1000.0,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(100, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 10.0),
                  child: Text(
                    product == null ? categoty!.name : '',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
