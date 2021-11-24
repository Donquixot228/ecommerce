import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/blocs/category/category_bloc.dart';
import 'package:ecommerce/models/models.dart';

import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: const CustomNavBarr(),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    //tall image
                    aspectRatio: 1.5,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 0.7,
                    //ао аокам чутка видно дрпугие фото
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    //INITIAL
                    initialPage: 1,
                    autoPlay: true,
                    //AUTOPLAY
                  ),
                  items: state.categories
                      .map((category) => HeroCarouselCard(categoty: category))
                      .toList(),
                );
              } else {
                return Text('Something go wrong');
              }
            },
          ),
          const SelectionTitle(
            title: 'New',
          ),
          ProductCarousel(
              products:
                  Product.products.where((product) => product.isNew).toList()),
          const SelectionTitle(
            title: 'Popular',
          ),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList()),
        ],
      ),
    );
  }
}
