import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop_udemy/exeptions/http_exeption.dart';
import 'package:shop_udemy/utils/constantes.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite(String token, String userId) async {
    _toggleFavorite();
    final response = await http.put(
      Uri.parse('${Constants.USER_FAVORITES_URL}/$userId/$id.json?auth=$token'),
      body: jsonEncode(
        isFavorite,
      ),
    );

    if (response.statusCode >= 400) {
      _toggleFavorite();
      notifyListeners();

      throw HttpException(
        msg: 'Erro no momento de fazer a requisição ao servidor',
        statusCode: response.statusCode,
      );
    }
  }
}
