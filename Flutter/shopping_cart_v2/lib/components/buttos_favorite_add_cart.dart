import 'package:flutter/material.dart';

class ButtonsAddAndFavorite extends StatelessWidget {
  const ButtonsAddAndFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.amber[600],
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
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
