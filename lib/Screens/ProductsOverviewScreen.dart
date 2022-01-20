import 'package:flutter/material.dart';

import '../Widgets/ProductsGrid.dart';

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
    return Scaffold(
      backgroundColor: Color(0xffffc9ea),
      appBar: AppBar(
        // backgroundColor: Color(0xff93cd48),
        // backgroundColor: Color.fromRGBO(24, 13, 198, 1.0),
        title: Text('Shop Force'),
        centerTitle: true,
        actions: [
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
          )
        ],
      ),
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
              )),
        ],
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
