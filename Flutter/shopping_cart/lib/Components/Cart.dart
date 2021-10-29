import 'package:flutter/material.dart';

class CartItens extends StatelessWidget {
  final List itensCarrinho;
  final void Function(String id) onDelete;


  CartItens({
    required this.itensCarrinho,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itensCarrinho.length,
        itemBuilder: (ctx, index) {
          final product = itensCarrinho[index];
          return Column(
            children: [
              Container(
                height: 200,
                child: Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => onDelete(product['id']),
                        icon: Icon(
                          Icons.remove_circle,
                          size: 45,
                          color: Colors.red,
                        ),
                      ),
                      Image(image: NetworkImage(product['thumbnail'])),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              product['title'],
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              'R\$ ${product['price'].toString()}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
