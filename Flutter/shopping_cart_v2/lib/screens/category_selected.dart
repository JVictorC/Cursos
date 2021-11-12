import 'package:flutter/material.dart';

class CategorySelected extends StatelessWidget {
  const CategorySelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            category['name'],
            style: const TextStyle(
              fontSize: 25
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(category['name']),
      ),
    );
  }
}
