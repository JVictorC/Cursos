import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_v2/screens/cart_itens.dart';
import 'package:shopping_cart_v2/store/cart.store.dart';
import './screens/my_home_page.dart';
import './utils/app_router.dart';
import './screens/category_selected.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CartItens>(create: (_) => CartItens())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: const ColorScheme.light().copyWith(
                primary: Colors.yellow[700], secondary: Colors.grey[700]),
            textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                    fontSize: 35,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600),
                headline6: TextStyle(fontSize: 18, color: Colors.grey[700]))),
        routes: {
          AppRoutes.HOME: (ctx) => const MyHomePage(),
          AppRoutes.CATEGORY: (ctx) => const CategorySelected(),
          AppRoutes.CART: (ctx) => const CartScreen()
        },
      ),
    );
  }
}
