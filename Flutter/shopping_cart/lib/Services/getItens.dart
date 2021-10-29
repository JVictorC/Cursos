import 'dart:convert';
import 'package:http/http.dart' as http;


getArrayListItemByName(String product) async {
  final url = Uri.parse('https://api.mercadolibre.com/sites/MLB/search?q=$product');

  final response = await http.get(url);
  final json = jsonDecode(response.body);
  return json['results'];
}