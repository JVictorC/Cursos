import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_udemy/exeptions/http_exeption.dart';
import 'package:shop_udemy/models/products.dart';
import 'package:shop_udemy/utils/constantes.dart';

class ProductList with ChangeNotifier {

  final List<Product> _itens = [];

  List<Product> get itens => [..._itens];

  Future<void> loadProducts() async {
    _itens.clear();

    final response = await http.get(Uri.parse('${Constants.PRODUCT_BASE_URL}.json'));

    if (response.body == 'null') return;

    final Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((productId, productData) {
      _itens.add(
        Product(
            id: productId,
            name: productData['name'],
            description: productData['description'],
            price: productData['price'],
            imageUrl: productData['imageUrl'],
            isFavorite: productData['isFavorite']),
      );
    });
    notifyListeners();
  }

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
      Uri.parse('${Constants.PRODUCT_BASE_URL}.json'),
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
    if (index >= 0) {
      await http.patch(
        Uri.parse('${Constants.PRODUCT_BASE_URL}/${product.id}.json'),
        body: jsonEncode(
          {
            "name": product.name,
            "description": product.description,
            "price": product.price,
            "imageUrl": product.imageUrl,
          },
        ),
      );
      _itens[index] = product;
      notifyListeners();
    }
  }

  Future<void> removeProduct(Product product) async {
    int index = _itens.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      final productForVerification = _itens[index];
      _itens.remove(productForVerification);

      final response = await http.delete(
        Uri.parse('${Constants.PRODUCT_BASE_URL}/${product.id}.json'),
      );

      if (response.statusCode >= 400) {
        _itens.insert(index, productForVerification);
        throw HttpException(
          msg: 'Não Foi possível excluir o produto',
          statusCode: response.statusCode,
        );
      }
    }
    notifyListeners();
  }
}
