import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> fetchCategories() async {
  final Uri url = Uri.parse('https://api.mercadolibre.com/sites/MLB/categories');
  final response = await http.get(url);
  return json.decode(response.body);
}