import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_force/Models/ProductModel.dart';
import '../Providers/CartProvider.dart';
import '../Screens/ProductDetailScreen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context, listen: false);
    // Widget does not rebuild when changes occur in cart while listen: false
    final cart = Provider.of<CartProvider>(context, listen: false);
    print('product rebuilds');

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black12,
          leading: Consumer<ProductModel>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                Icons.favorite,
                size: 14,
                color: product.isFavourite ? Colors.red : Colors.white70,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              size: 14,
            ),
            color: Colors.pink,
            onPressed: () {
              cart.addItem(
                productId: product.id!,
                price: product.price,
                title: product.title,
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added To Cart'),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Color(0xff7559ec),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.removeSingleItem(product.id!);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
