import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_udemy/components/app_drawer.dart';
import 'package:shop_udemy/components/order.dart';
import 'package:shop_udemy/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (ctx, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapShot.error != null) {
            return const Center(
              child: Text('Ocorreu um Erro durante a requisição ao Servidor'),
            );
          }
          return RefreshIndicator(
            onRefresh: () {
              return Provider.of<OrderList>(
                context,
                listen: false,
              ).loadOrders();
            },
            child: Consumer<OrderList>(
              builder: (ctx, orders, child) {
                return ListView.builder(
                  itemCount: orders.items.length,
                  itemBuilder: (ctx, index) {
                    final order = orders.items[index];
                    return OrderWidget(
                      order: order,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
