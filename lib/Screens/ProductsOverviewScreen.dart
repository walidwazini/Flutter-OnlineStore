import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/ProductsGrid.dart';
import '../Widgets/Badge.dart';
import '../Providers/CartProvider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  // const ProductsOverviewScreen({Key? key}) : super(key: key);
  static const String id = '/product_overview';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    // final cartData = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffffc9ea),
      appBar: AppBar(
          // backgroundColor: Color(0xff93cd48),
          // backgroundColor: Color.fromRGBO(24, 13, 198, 1.0),
          title: Text('Shop Force'),
          centerTitle: true,
          actions: [
            // Todo : Badge
            // Should be use for Consumer
            Badge(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
              value: '1',
            ),
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    // .. show all product
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favourites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
            ),
          ]),
      body: Stack(
        children: [
          Container(
            child: ProductsGrid(_showOnlyFavorites),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white24,
                  Colors.red,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget originalBadge() {
    return Consumer<CartProvider>(
      builder: (_, cartData, ch) => Badge(
        child: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        value: cartData.itemCount.toString(),
      ),
    );
  }
}

// Container(
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [
// Colors.white24,
// Colors.red,
// ],
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// ),
// )
// ),
