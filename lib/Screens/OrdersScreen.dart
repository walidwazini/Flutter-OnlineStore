import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/OrderItem.dart';
import '../Widgets/AppDrawer.dart';
import '../Providers/OrdersProvider.dart';

class OrdersScreen extends StatelessWidget {
  // const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final _orderData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Oder'),
      ),
      body: ListView.builder(
        itemCount: _orderData.orders.length,
        itemBuilder: (orderCtx, i)  => OrderItem(
          order: _orderData.orders[i],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
