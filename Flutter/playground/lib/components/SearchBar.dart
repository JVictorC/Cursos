import 'dart:ui';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function(String) onSubmit;

  SearchBar({required this.onSubmit});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var _searchItem = TextEditingController();

  _submitSeaarch() {
    if (_searchItem.text != '') {
      widget.onSubmit(_searchItem.text);
      setState(() {
        _searchItem.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: TextField(
              onSubmitted: (_) => _submitSeaarch(),
              decoration: InputDecoration(
                labelText: 'Item de Procura',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
              controller: _searchItem,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: _submitSeaarch,
            child: Text(
              'Pesquisar',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).primaryColor,
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              'assets/images/searchItens.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
