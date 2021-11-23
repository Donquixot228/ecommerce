import 'dart:async';

import 'package:ecommerce/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {


  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), ()=> Navigator.pushNamed(context, '/'));
    return Scaffold(
      backgroundColor: Color(0xFFED1C24),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Center(
               child: Image(image: AssetImage('assets/images/suprem.png'),),
             )
           ],
         ),
    );
  }
}
