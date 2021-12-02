import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_udemy/models/auth.dart';
import 'package:shop_udemy/pages/auth_page.dart';
import 'package:shop_udemy/pages/products_overview_page.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);

    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapShot.error != null) {
          return const Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return auth.isAuth ? const ProductsOverViewPage() : const AuthPage();
        }
      },
    );
  }
}
