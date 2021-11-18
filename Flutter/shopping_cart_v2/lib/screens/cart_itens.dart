import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_v2/store/cart.store.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeCart = Provider.of<CartItens>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Cart',
            style: TextStyle(fontSize: 25),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
                const SizedBox(width: 5),
                Observer(
                  builder: (_) => Text(
                    '${storeCart.arrayCartItens.length}',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: storeCart.arrayCartItens.length,
          itemBuilder: (ctx, index) {
            final item = storeCart.arrayCartItens[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: ListTile(
                    title: Text(
                      item.title,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'R\$ ${item.price}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    leading: Image.network(item.image),
                    trailing: Column(
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
