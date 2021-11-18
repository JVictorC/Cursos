import 'package:flutter/material.dart';
import '../utils/app_router.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);


  void _openScreenCart(context) {
    Navigator.of(context).pushNamed(AppRoutes.CART);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => _openScreenCart(context),
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
    );
  }
}
