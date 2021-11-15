import 'package:flutter/material.dart';
import '../utils/app_router.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  final Map category;

  void _selectedCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORY,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: SizedBox(
            width: 100,
            child: Text(
              category['name'],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}
