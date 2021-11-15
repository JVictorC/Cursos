import 'package:flutter/material.dart';

import 'buttos_favorite_add_cart.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.item}) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
              item['thumbnail'],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Text(
                item['title'],
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Text('R\$ ${item['price']}'),
          const ButtonsAddAndFavorite()
        ],
      ),
    );
  }
}
