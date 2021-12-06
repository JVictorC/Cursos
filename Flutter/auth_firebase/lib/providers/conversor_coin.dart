import 'package:flutter/foundation.dart';

class ConversorCoin with ChangeNotifier {
  String _coinForConvert = 'USD';

  String get coinForConverson => _coinForConvert;

  void setCoinToConvert(String coin) {
    _coinForConvert = coin;
    notifyListeners();
  }
}