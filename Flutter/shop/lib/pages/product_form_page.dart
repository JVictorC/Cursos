import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_udemy/models/products.dart';
import 'package:shop_udemy/models/products_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageURLFocus = FocusNode();
  final _imageURLController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Map<String, Object> _formDate = {};

  @override
  void initState() {
    super.initState();
    _imageURLFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(_formDate.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if(arg != null) {
        final product = arg as Product;
        _formDate['id'] = product.id;
        _formDate['name'] = product.name;
        _formDate['price'] = product.price;
        _formDate['description'] = product.description;
        _formDate['imageUrl'] = product.imageUrl;

        _imageURLController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageURLFocus.dispose();
    _imageURLFocus.removeListener(updateImage);
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidImageUrl(String url) {
    final bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    final bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');

    return isValidUrl && endsWithFile;
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      _formKey.currentState?.save();
      Provider.of<ProductList>(
        context,
        listen: false,
      ).saveProduct(_formDate);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formDate['name']?.toString(),
                decoration: const InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (name) => _formDate['name'] = name ?? '',
                validator: (_name) {
                  final name = _name ?? '';
                  // .trim() remove espaços
                  if (name.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  if (name.trim().length < 3) {
                    return 'Nome precisa de no minimo de 3 letras';
                  }
                },
              ),
              TextFormField(
                initialValue: _formDate['price']?.toString(),
                decoration: const InputDecoration(labelText: 'Preço'),
                focusNode: _priceFocus,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                onSaved: (price) =>
                    _formDate['price'] = double.parse(price ?? '0'),
                validator: (_price) {
                  final priceString = _price ?? '-1';
                  final price = double.tryParse(priceString) ?? -1;
                  if (price <= 0) {
                    return 'Informe Um Preço Valido';
                  }
                },
              ),
              TextFormField(
                initialValue: _formDate['description']?.toString(),
                decoration: const InputDecoration(labelText: 'Descrição'),
                textInputAction: TextInputAction.next,
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageURLFocus);
                },
                onSaved: (description) =>
                    _formDate['description'] = description ?? '',
                validator: (_description) {
                  final description = _description ?? '';
                  // .trim() remove espaços
                  if (description.trim().isEmpty) {
                    return 'Descrição é obrigatório';
                  }
                  if (description.trim().length < 10) {
                    return 'Descrição precisa de no minimo de 3 letras';
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Url da Image'),
                      textInputAction: TextInputAction.done,
                      focusNode: _imageURLFocus,
                      keyboardType: TextInputType.url,
                      controller: _imageURLController,
                      onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (imageUrl) =>
                          _formDate['imageUrl'] = imageUrl ?? '',
                      validator: (_imageURL) {
                        final imageUrl = _imageURL ?? '';
                        if (!isValidImageUrl(imageUrl)) {
                          return 'Informe uma Url Válida';
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: _imageURLController.text.isEmpty
                        ? const Text('Informe a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageURLController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                    alignment: Alignment.center,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
