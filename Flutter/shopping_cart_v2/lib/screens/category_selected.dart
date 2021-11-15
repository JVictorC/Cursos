import 'package:flutter/material.dart';
import 'package:shopping_cart_v2/components/footer.dart';
import 'package:shopping_cart_v2/components/future_itens_by_categories.dart';

class CategorySelected extends StatelessWidget {
  const CategorySelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: FittedBox(
            child: Text(
              category['name'],
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
      body: FutureItens(category: category,),
      bottomNavigationBar: const Footer(),
    );
  }
}
