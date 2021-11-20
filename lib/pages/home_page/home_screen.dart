import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomNavBarr(),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            scrollPhysics: BouncingScrollPhysics(),
            //tall image
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            //ао аокам чутка видно дрпугие фото
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            //INITIAL

            //AUTOPLAY
          ),
          items: Category.categories.map((category) =>
              HeroCarouselCard(categoty: category)).toList(),
        ),
      ),
    );
  }
}
