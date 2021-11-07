import 'package:flutter/material.dart';
import '../models/CartModel.dart';

class ListItens extends StatelessWidget {
  final List arrayForMap;
  final void Function(Cart newItem) onAddNewItem;

  ListItens({required this.arrayForMap, required this.onAddNewItem});

  handleClickOnAddItemInCart(Map item) {
    final newItem = Cart(
      id: item['id'],
      name: item['title'],
      price: item["price"].toDouble(),
      image: item['thumbnail'],
      date: DateTime.now(),
    );
    onAddNewItem(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: arrayForMap.length,
      itemBuilder: (ctx, index) {
        final item = arrayForMap[index];

        return Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Image.network(item['thumbnail']),
                ),
                title: Text(
                  item['title'],
                  textAlign: TextAlign.center,
                ),
                subtitle: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0,0),
                  child: Text(
                    "R\$ ${item['price'].toString()}",
                    textAlign: TextAlign.center,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 35,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () => handleClickOnAddItemInCart(item),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
