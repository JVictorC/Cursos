import 'package:flutter/foundation.dart';
import 'package:shop_udemy/data/dummy_data.dart';
import 'package:shop_udemy/models/products.dart';

class ProductList with ChangeNotifier {
  final List<Product> _itens = dummyProducts;

  List<Product> get itens => [..._itens]; 
  List<Product> get favoriteItens => 
      _itens.where((element) => element.isFavorite).toList(); 


// bool _showFavoriteOnly = false;

//   List<Product> get itens {
//     if(_showFavoriteOnly) {
//       return _itens.where((element) => element.isFavorite).toList();
//     }

//     return [..._itens];
//   } 

//   void showFavoriteOnly() {
//     _showFavoriteOnly = true;
//     notifyListeners();
//   }

//   void showAll() {
//     _showFavoriteOnly = false;
//     notifyListeners();
//   }



}