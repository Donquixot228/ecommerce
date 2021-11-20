
import 'package:ecommerce/pages/screens.dart';
import 'package:flutter/cupertino.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){

    print('This is route : ${settings.name}');


    switch(settings.name){
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();



      default:
        return _errorRoute();

    }







  }



}