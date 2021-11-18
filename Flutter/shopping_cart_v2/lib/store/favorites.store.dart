import 'package:mobx/mobx.dart';
import '../models/favorite_item.dart';
part 'favorites.store.g.dart';


class FavoriteItens = _FavoritesItens with _$FavoriteItens;

abstract class _FavoritesItens with Store {
  @observable
  List<FavoriteItem> arrayFavoritesItens = [];


  @action
  void addNewItenFavorite(FavoriteItem newFavoriteItem) {
    arrayFavoritesItens.add(newFavoriteItem);
  }
}