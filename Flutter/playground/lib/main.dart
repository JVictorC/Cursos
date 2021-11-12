import 'package:flutter/material.dart';
import './models/CartModel.dart';
import './components/SearchBar.dart';
import './services/fetchItensByName.dart';
import './components/ListItens.dart';
import './components/Welcome.dart';
import './components/Cart.dart';

main() => runApp(MyPlayGround());

class MyPlayGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.yellow[700],
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.white, primary: Colors.yellow[700]),
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(headline1: TextStyle(color: Colors.red)),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.black, fontSize: 25)),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Cart> _listCart = [];

  List _arrayForMap = [];

  String _nameItemForSearch = '';

  bool _isLoading = false;

  _seacrItensByName(String name) async {
    Navigator.of(context).pop();
    setState(() {
      _isLoading = true;
      _nameItemForSearch = name;
    });
    final results = await fetchItensByName(name);
    setState(() {
      _arrayForMap = results;
      _isLoading = false;
    });
  }

  _addItensInCart(Cart newItem) {
    _listCart.removeWhere((element) => element.id == newItem.id);
    setState(() {
      _listCart.add(newItem);
    });
  }

  _openModalSearchItens() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SearchBar(
          onSubmit: _seacrItensByName,
        );
      },
    );
  }

  _openModalCart() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return CartComponent(listItens: _listCart);
        });
  }

  @override
  Widget build(context) {
    final appBar = AppBar(
      title: Text(
        'PlayGround Flutter',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(
                Icons.shopping_cart,
                size: 30,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                _listCart.length.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 25,
                ),
              )
            ],
          ),
        )
      ],
    );
    final navegation = Container(
      height: 50,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: _openModalCart,
            icon: Icon(
              Icons.shopping_cart,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          IconButton(
            onPressed: _openModalSearchItens,
            icon: Icon(
              Icons.search,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );

    final _avaibleHeigth = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        100 -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: _nameItemForSearch == ''
          ? Welcome()
          : Container(
              height: _avaibleHeigth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: _avaibleHeigth * 0.15,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          _nameItemForSearch == ''
                              ? ''
                              : 'O Item de Procura é: $_nameItemForSearch',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                  _isLoading
                      ? Container(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.primary,
                            ),
                            strokeWidth: 10,
                          ),
                        )
                      : Container(
                          height: _avaibleHeigth * 0.85,
                          child: ListItens(
                            arrayForMap: _arrayForMap,
                            onAddNewItem: _addItensInCart,
                          ),
                        )
                ],
              ),
            ),
      bottomNavigationBar: navegation,
    );
  }
}
