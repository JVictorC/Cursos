import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop_udemy/data/dummy_data.dart';
import 'package:shop_udemy/models/products.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = 'https://shop-jvictorc-default-rtdb.firebaseio.com';
  final List<Product> _itens = dummyProducts;
  bool _isLoading = false;

  List<Product> get itens => [..._itens];

  bool get isLoading => _isLoading;

  List<Product> get favoriteItens =>
      _itens.where((element) => element.isFavorite).toList();

  int get itemsCount => _itens.length;

  Future<void> saveProduct(Map<String, Object> newItem) {
    bool hasId = newItem['id'] != null;

    final product = Product(
      id: hasId ? newItem['id'] as String : Random().nextDouble().toString(),
      name: newItem['name'] as String,
      description: newItem['description'] as String,
      price: newItem['price'] as double,
      imageUrl: newItem['imageUrl'] as String,
    );

    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> addProduct(Product data) async {
    final request = await http.post(
      Uri.parse('$_baseUrl/products.json'),
      body: jsonEncode(
        {
          "name": data.name,
          "description": data.description,
          "price": data.price,
          "imageUrl": data.imageUrl,
          "isFavorite": data.isFavorite,
        },
      ),
    );

    final id = jsonDecode(request.body)['name'];
    _itens.add(
      Product(
        id: id,
        name: data.name,
        description: data.description,
        price: data.price,
        imageUrl: data.imageUrl,
      ),
    );
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    int index = _itens.indexWhere((element) => element.id == product.id);
    if (index > 0) {
      _itens[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    int index = _itens.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      _itens.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }
}
