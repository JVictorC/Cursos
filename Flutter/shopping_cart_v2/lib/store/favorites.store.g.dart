// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteItens on _FavoritesItens, Store {
  final _$arrayFavoritesItensAtom =
      Atom(name: '_FavoritesItens.arrayFavoritesItens');

  @override
  List<FavoriteItem> get arrayFavoritesItens {
    _$arrayFavoritesItensAtom.reportRead();
    return super.arrayFavoritesItens;
  }

  @override
  set arrayFavoritesItens(List<FavoriteItem> value) {
    _$arrayFavoritesItensAtom.reportWrite(value, super.arrayFavoritesItens, () {
      super.arrayFavoritesItens = value;
    });
  }

  final _$_FavoritesItensActionController =
      ActionController(name: '_FavoritesItens');

  @override
  void addNewItenFavorite(FavoriteItem newFavoriteItem) {
    final _$actionInfo = _$_FavoritesItensActionController.startAction(
        name: '_FavoritesItens.addNewItenFavorite');
    try {
      return super.addNewItenFavorite(newFavoriteItem);
    } finally {
      _$_FavoritesItensActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
arrayFavoritesItens: ${arrayFavoritesItens}
    ''';
  }
}
