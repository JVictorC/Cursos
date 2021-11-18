// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartItens on _CartItens, Store {
  final _$arrayCartItensAtom = Atom(name: '_CartItens.arrayCartItens');

  @override
  ObservableList<CartItem> get arrayCartItens {
    _$arrayCartItensAtom.reportRead();
    return super.arrayCartItens;
  }

  @override
  set arrayCartItens(ObservableList<CartItem> value) {
    _$arrayCartItensAtom.reportWrite(value, super.arrayCartItens, () {
      super.arrayCartItens = value;
    });
  }

  final _$_CartItensActionController = ActionController(name: '_CartItens');

  @override
  void addItensInCart(CartItem value) {
    final _$actionInfo = _$_CartItensActionController.startAction(
        name: '_CartItens.addItensInCart');
    try {
      return super.addItensInCart(value);
    } finally {
      _$_CartItensActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
arrayCartItens: ${arrayCartItens}
    ''';
  }
}
