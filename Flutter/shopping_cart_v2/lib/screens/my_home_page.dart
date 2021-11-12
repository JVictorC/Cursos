import 'package:flutter/material.dart';
import '../services/fetch_categories.dart';
import '../components/card_category.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List responseAPI = [];

  Future<List> _getCategories() async {
    final List response = await fetchCategories();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List>(
        future: _getCategories(),
        builder: (context, snapshot) {
          return Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: snapshot.data!.map((element) {
                return CategoryItem(category: element);
              }).toList(),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.primary,
                size: 45,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
                size: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
