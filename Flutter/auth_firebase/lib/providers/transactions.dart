import 'package:auth_firebase/data/dummy_data.dart';
import 'package:auth_firebase/models/transaction.dart';
import 'package:flutter/foundation.dart';

class TransActionsProvider with ChangeNotifier {
  final _itensTransActions = dummy_data;

  List<TransAction> get getItems => [..._itensTransActions];
}