import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  final List products;
  final void Function(Map newValue) onAddItem;

  ListProducts({
    required this.products,
    required this.onAddItem,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = products.map((e) {
      return Container(
        width: double.infinity,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(e['thumbnail']),
                width: 150,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 150,
                    child: Text(
                      e['title'],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 150,
                    child: Text(
                      'R\$ ${e['price'].toString()}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => onAddItem(e),
                    child: Text('Adicionar ao Carrinho'),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }).toList();

    return Container(
      child: Container(
        height: 500,
        child: SingleChildScrollView(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 22.5,
            children: widgets,
          ),
        ),
      ),
    );
  }
}
