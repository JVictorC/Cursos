import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_v2/models/favorite_item.dart';
import 'package:shopping_cart_v2/store/cart.store.dart';
import '../models/cart_item.dart';

class ButtonsAddAndFavorite extends StatelessWidget {
  const ButtonsAddAndFavorite({Key? key, required this.dateItem})
      : super(key: key);

  final Map dateItem;

  void _handleAddNewFavoriteItem() {
    final newItem = FavoriteItem(
      id: dateItem['id'],
      price: dateItem['price'],
      title: dateItem['title'],
      image: dateItem['thumbnail'],
    );
  }

  @override
  Widget build(BuildContext context) {
    final storeCart = Provider.of<CartItens>(context);

    void _handleAddItemInCart() {
      final newItem = CartItem(
          id: dateItem['id'],
          title: dateItem['title'],
          price: dateItem['price'],
          image: dateItem['thumbnail']);
      storeCart.addItensInCart(newItem);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: _handleAddItemInCart,
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.amber[600],
            size: 30,
          ),
        ),
        IconButton(
          onPressed: _handleAddNewFavoriteItem,
          icon: Icon(
            Icons.favorite_border,
            color: Colors.red[600],
            size: 30,
          ),
        )
      ],
    );
  }
}
