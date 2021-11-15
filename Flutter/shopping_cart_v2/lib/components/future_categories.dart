import 'package:flutter/material.dart';
import 'package:shopping_cart_v2/services/fetch_categories.dart';

import 'card_category.dart';

class FutureCategories extends StatelessWidget {
  const FutureCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchCategories(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          final results = snapShot.data;
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2,
              ),
              itemCount: results!.length,
              itemBuilder: (ctx, index) {
                final category = results[index];
                return CategoryItem(
                  category: category,
                );
              },
            ),
          );
        }
        return const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              strokeWidth: 8,
            ),
          ),
        );
      },
    );
  }
}
