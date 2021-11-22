// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_udemy/components/app_drawer.dart';
import 'package:shop_udemy/components/badge.dart';
import 'package:shop_udemy/components/product_grid.dart';
import 'package:shop_udemy/models/cart.dart';
import 'package:shop_udemy/models/products_list.dart';
import 'package:shop_udemy/utils/app_routes.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverViewPage extends StatefulWidget {
  const ProductsOverViewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsOverViewPage> createState() => _ProductsOverViewPageState();
}

class _ProductsOverViewPageState extends State<ProductsOverViewPage> {
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha loja'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions seletedValue) {
              setState(() {
                if (seletedValue == FilterOptions.Favorite) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: const Icon(Icons.shopping_cart),
            builder: (ctx, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.CART),
                icon: child!,
              ),
            ),
          )
        ],
      ),
      body: ProductGrid(
        showFavoritesOnly: _showFavoritesOnly,
      ),
      drawer: const AppDrawer(),
    );
  }
}
