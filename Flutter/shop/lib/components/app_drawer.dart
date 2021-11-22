import 'package:flutter/material.dart';
import 'package:shop_udemy/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            AppBar(
              title: const Text('Bem Vindo Usuário'),
              automaticallyImplyLeading: false,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Loja'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Pedidos'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS),
            ),
          ],
        ),
      ),
    );
  }
}