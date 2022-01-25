import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_force/Providers/ProductsProvider.dart';

import '../Widgets/ProductItem.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);
  // Todo : Instead of constructor to receive loadedProducts as input
  // We set a listener from provider
  @override
  Widget build(BuildContext context) {
    final productsData =  Provider.of<ProductProvider>(context);
    //items is a getter ( for all products or favorites)
    final loadedProducts = showFavs
        ? productsData.favoriteItems
        : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
        // create: (p) => loadedProducts[i],
        value: loadedProducts[i],
        child: ProductItem(
          // id: loadedProducts[i].id,
          // title: loadedProducts[i].title,
          // imageUrl: loadedProducts[i].imageUrl,
        ),
      ) ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}