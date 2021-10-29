import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String value) onSubmit;
  final emailController = TextEditingController();


  SearchBar({ required this.onSubmit });

  _submitForm() {
    onSubmit(emailController.text.toString());
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            child: TextField(
              onSubmitted: (_) => _submitForm(),
              textAlign: TextAlign.center,
              controller: emailController,
              decoration: InputDecoration(labelText: 'Digite o Produto'),
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text('Pesquisar'),
            ),
          )
        ],
      ),
    );
  }
}
