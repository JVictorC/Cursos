import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_udemy/components/app_drawer.dart';
import 'package:shop_udemy/components/order.dart';
import 'package:shop_udemy/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderList.items.length,
        itemBuilder: (ctx, index) {
          final order = orderList.items[index];
          return OrderWidget(order: order,);
        },
      ),
    );
  }
}
