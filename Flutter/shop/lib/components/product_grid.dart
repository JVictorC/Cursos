import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_udemy/components/product_grid_item.dart';
import 'package:shop_udemy/models/products.dart';
import 'package:shop_udemy/models/products_list.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoritesOnly;
  const ProductGrid({
    Key? key,
    required this.showFavoritesOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        showFavoritesOnly ? provider.favoriteItens : provider.itens;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (crx, index) {
        return ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: const ProductGridItem(),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
