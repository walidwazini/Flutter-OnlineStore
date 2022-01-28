import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_force/Widgets/AppDrawer.dart';

import '../Providers/ProductsProvider.dart';
import '../Widgets/UserProduct_Item.dart';

class UserProductsScreen extends StatelessWidget {
  // const UserProductsScreen({Key? key}) : super(key: key);
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    // listen: true because we rebuild the list when products change
    final productsData = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/edit-product');
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              Divider(),
              UserProductItem(
                title: productsData.items[i].title,
                imageUrl: productsData.items[i].imageUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
