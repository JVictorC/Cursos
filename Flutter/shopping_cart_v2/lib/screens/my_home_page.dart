import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_cart_v2/components/footer.dart';
import 'package:shopping_cart_v2/components/future_categories.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
      body: const FutureCategories(),
      bottomNavigationBar: const Footer(),
    );
  }
}
