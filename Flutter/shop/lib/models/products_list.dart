import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop_udemy/data/dummy_data.dart';
import 'package:shop_udemy/models/products.dart';

class ProductList with ChangeNotifier {
  final List<Product> _itens = dummyProducts;

  List<Product> get itens => [..._itens];
  List<Product> get favoriteItens =>
      _itens.where((element) => element.isFavorite).toList();

  int get itemsCount => _itens.length;

  void addProduct(Product newItem) {
    _itens.add(newItem);
    notifyListeners();
  }

  void saveProduct(Map<String, Object> newItem) {
    bool hasId = newItem['id'] != null;

    final product = Product(
      id: hasId ? newItem['id'] as String : Random().nextDouble().toString(),
      name: newItem['name'] as String,
      description: newItem['description'] as String,
      price: newItem['price'] as double,
      imageUrl: newItem['imageUrl'] as String,
    );

    if (hasId) {
      updateProduct(product);
    } else {
      addProduct(product);
    }

    notifyListeners();
  }

  void updateProduct(Product product) {
    int index = _itens.indexWhere((element) => element.id == product.id);
    if(index > 0) {
      _itens[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    int index = _itens.indexWhere((element) => element.id == product.id);
    if(index >= 0) {
    _itens.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }
}
