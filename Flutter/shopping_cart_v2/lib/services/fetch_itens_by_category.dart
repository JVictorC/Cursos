import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> fetchItensByCategoryId(String id) async {
  final Uri url =
      Uri.parse("https://api.mercadolibre.com/sites/MLB/search?category=$id");
  final response = await http.get(url);

  return jsonDecode(response.body);
}