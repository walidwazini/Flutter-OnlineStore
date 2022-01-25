import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../Providers/OrdersProvider.dart';

class OrderItem extends StatefulWidget {
  final OrderItemModel order;

  const OrderItem({
    Key? key,
    required this.order,
  });

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            key: ValueKey(widget.order.orderId),
            title: Text('RM ${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd-MM-yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_more : Icons.expand_less),
              onPressed: () {
                print(widget.order.orderId);
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 10, 180),
              child: ListView(
                children: widget.order.products
                    .map(
                      (e) => content(e.title, e.quantity, e.price),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }

  Widget content(String title, int quantity, double price) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '${quantity} x RM ${price}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          )
        ],
      );
}
