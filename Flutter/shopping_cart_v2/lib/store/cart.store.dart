import 'package:mobx/mobx.dart';
import '../models/cart_item.dart';
part 'cart.store.g.dart';

class CartItens = _CartItens with _$CartItens;

abstract class _CartItens with Store {
  @observable
  var arrayCartItens = ObservableList<CartItem>();

  @action
  void addItensInCart(CartItem value) {
    arrayCartItens.add(value);
    print(arrayCartItens);
  }
}
