import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id, required this.title,
    required this.quantity, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('RM $price')),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total : RM ${(price * quantity)} '),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
