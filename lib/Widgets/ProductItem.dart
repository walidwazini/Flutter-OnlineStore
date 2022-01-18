import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_force/Models/ProductModel.dart';

import 'package:shop_force/Providers/ProductsProvider.dart';
import '../Screens/ProductDetailScreen.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key? key}) : super(key: key);
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem({
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
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
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              size: 14,
              color: product.isFavourite ? Colors.red : Colors.white70,
            ),
            onPressed: () {
              product.toggleFavoriteStatus();

            },
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
            color: Theme.of(context).highlightColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
