import 'package:flutter/material.dart';
import 'package:shopping_cart_v2/services/fetch_itens_by_category.dart';

import 'card_item.dart';

class FutureItens extends StatelessWidget {
  const FutureItens({Key? key, required this.category}) : super(key: key);

  final Map category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: fetchItensByCategoryId(category['id']),
      builder: (ctx, snapShot) {
        if (snapShot.hasData) {
          final results = snapShot.data?['results'];
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: GridView.builder(
              itemCount: results.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.5),
              itemBuilder: (ctx, index) {
                final item = results[index];
                return InkWell(
                  onTap: () {},
                  splashColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(15),
                  child: CardItem(
                    item: item,
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                strokeWidth: 8,
              ),
            ),
          );
        }
      },
    );
  }
}
