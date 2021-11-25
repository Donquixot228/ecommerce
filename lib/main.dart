import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/blocs/category/category_bloc.dart';
import 'package:ecommerce/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:ecommerce/pages/screens.dart';
import 'package:ecommerce/repositories/category/category_repository.dart';
import 'package:ecommerce/routes/app_router.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
