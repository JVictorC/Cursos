import 'dart:convert';

import 'package:auth_firebase/models/coin.dart';
import 'package:http/http.dart' as http;

Future<List<Coin>> getCoins() async {
  const url = 'https://economia.awesomeapi.com.br/json/all';
  final response = await http.get(Uri.parse(url));

  final Map json = await jsonDecode(response.body);

  final List<Coin> result = [];

  json.forEach((key, value) {
    if(key == 'USDT') return;
    result.add(
      Coin(
        code: value['code'],
        name: value['name'],
        high: double.parse(value['high']),
        low: double.parse(value['low']),
        ask: double.parse(value['ask']),
      ),
    );
  });

  return result;
}
