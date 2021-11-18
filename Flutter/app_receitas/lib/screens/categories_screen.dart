import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScrenn extends StatelessWidget {
  const CategoriesScrenn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(category: cat);
      }).toList(),
    );
  }
}