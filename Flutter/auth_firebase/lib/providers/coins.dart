import 'package:auth_firebase/models/coin.dart';
import 'package:auth_firebase/services/coins.dart';
import 'package:flutter/foundation.dart';

class Coins with ChangeNotifier {
  final List<Coin> _coins = [];

  List<Coin> get arrayCoins => [..._coins];

  Future<void> loadedCoins() async {
    final result = await getCoins();
    _coins.clear();
    _coins.addAll(result);
    notifyListeners();
  }

  Map<String, Object> mapCoins() {
    final Map<String, Object> mapCoins = {};

    for (var element in _coins) {
      mapCoins[element.code] = {
        'code': element.code,
        'ask': element.ask,
      };
    }

    return mapCoins;
  }

  double getDataOfThe(String code) {
    final result = _coins.where((element) => element.code == code).toList();
    return result[0].ask;
  }
}
