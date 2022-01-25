import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Color(0xffb30822),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          // show dialog return a Future but on boolean value
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Remove Item'),
            content: Text('Confirm to remove item  ?'),
            actions: [
              TextButton(
                child: Text('Yes'),
                onPressed: (){
                  Navigator.of(ctx).pop(true);
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: (){
                  Navigator.of(ctx).pop(false);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeItem(productId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed from Cart'),
            backgroundColor: Color(0xffec282f),
          ),
        );
      },
      child: Card(
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
      ),
    );
  }
}
