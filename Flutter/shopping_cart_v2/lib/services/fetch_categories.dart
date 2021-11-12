import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchCategories() async {
  final Uri url = Uri.parse('https://api.mercadolibre.com/sites/MLB/categories');
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  return json;
}