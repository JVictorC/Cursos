import 'dart:convert';

import 'package:http/http.dart' as http;

fetchItensByName(String item) async {
  final url =
      Uri.parse("https://api.mercadolibre.com/sites/MLB/search?q=$item");

  final r = await http.get(url);
  final json = await jsonDecode(r.body);
  return json['results'];
}
