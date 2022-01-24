import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Providers/OrdersProvider.dart';

class OrderItem extends StatelessWidget {
  final OrderItemModel order;

  const OrderItem({
    Key? key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            key: ValueKey(order.orderId),
            title: Text('RM ${order.amount}'),
            subtitle: Text(
              DateFormat('dd-MM-yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: (){
                print(order.orderId);
              },
            ),
          )
        ],
      ),
    );
  }
}
