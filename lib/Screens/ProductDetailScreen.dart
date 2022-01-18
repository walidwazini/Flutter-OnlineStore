import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ProductsProvider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen({required this.title,});
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)?.settings.arguments as String;
    // Todo Get all data from id
    final loadedProducts = Provider.of<ProductProvider>(context, listen: false)
        .findById(productID);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loadedProducts.title),
      ),
    );
  }
}
