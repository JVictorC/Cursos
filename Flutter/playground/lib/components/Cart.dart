import 'package:flutter/material.dart';
import '../models/CartModel.dart';

class CartComponent extends StatelessWidget {
  final List<Cart> listItens;

  CartComponent({required this.listItens});

  @override
  Widget build(BuildContext context) {
    return listItens.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Carrinho Está Vazio',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 35),
                  ),
                ),
                Flexible(
                  child: Image.asset(
                    'assets/images/carrinhoVazio.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.all(20),
            height: double.infinity,
            child: ListView.builder(
              itemCount: listItens.length,
              itemBuilder: (ctx, index) {
                final item = listItens[index];
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListTile(
                      title: Text(item.name, textAlign: TextAlign.center),
                      subtitle: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "R\$ ${item.price.toString()}",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        child: Image.network(item.image),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
