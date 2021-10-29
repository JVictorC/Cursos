import 'dart:ffi';

import 'package:flutter/material.dart';
import './Components/SearchBar.dart';
import 'Services/getItens.dart';
import 'Components/ListProduct.dart';
import 'Components/Cart.dart';

main() {
  runApp(ShopingCart());
}

class ShopingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _itensList = [];

  String _itemDeProcura = '';

  List _itensCarrinho = [];

  _pesquisar(String value) async {
    setState(() {
      _itemDeProcura = value;
    });
    List array = await getArrayListItemByName(value);
    setState(() {
      _itensList = array;
    });
  }

  _mostrarModalCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          child: CartItens(
            itensCarrinho: _itensCarrinho,
            onDelete: _removeItemCArrinho,
          ),
        );
      },
    );
  }

  _addItemNoCarrinho(Map newValue) {
    setState(() {
      _itensCarrinho.add(newValue);
    });
  }

  _removeItemCArrinho(String idParaRemover) {
    final arrayFilter = _itensCarrinho.where((element) => element['id'] != idParaRemover);
    setState(() {
      _itensCarrinho = arrayFilter.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          IconButton(
            onPressed: () => _mostrarModalCart(context),
            icon: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBar(onSubmit: _pesquisar),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Termo Procurado: $_itemDeProcura',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListProducts(
                products: _itensList,
                onAddItem: _addItemNoCarrinho,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarModalCart(context),
        child: Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
