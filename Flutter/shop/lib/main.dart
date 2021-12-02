import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_udemy/models/auth.dart';
import 'package:shop_udemy/models/cart.dart';
import 'package:shop_udemy/models/order_list.dart';
import 'package:shop_udemy/models/products_list.dart';
import 'package:shop_udemy/pages/auth_or_home_page.dart';
import 'package:shop_udemy/pages/cart_page.dart';
import 'package:shop_udemy/pages/orders_page.dart';
import 'package:shop_udemy/pages/product_detail_page.dart';
import 'package:shop_udemy/pages/product_form_page.dart';
import 'package:shop_udemy/pages/produts_page.dart';
import 'package:shop_udemy/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, auth, previus) => ProductList(
            auth.token ?? '',
            previus?.itens ?? [],
            auth.userId ?? '',
          ),
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, auth, previus) => OrderList(
            auth.token ?? '',
            previus?.items ?? [],
            auth.userId ?? '',
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Latto',
            colorScheme: ThemeData.light().colorScheme.copyWith(
                  primary: Colors.purple,
                  secondary: Colors.deepOrange,
                ),
            textTheme: ThemeData.light()
                .textTheme
                .copyWith(headline6: const TextStyle(color: Colors.white))),
        routes: {
          AppRoutes.AUTH_OR_HOME: (_) => const AuthOrHomePage(),
          AppRoutes.PRODUCT_DETAIL: (_) => const ProductDetailPage(),
          AppRoutes.CART: (_) => const CartPage(),
          AppRoutes.ORDERS: (_) => const OrdersPage(),
          AppRoutes.PRODUCTS: (_) => const ProductsPage(),
          AppRoutes.PRODUCT_FORM: (_) => const ProductFormPage(),
        },
      ),
    );
  }
}
