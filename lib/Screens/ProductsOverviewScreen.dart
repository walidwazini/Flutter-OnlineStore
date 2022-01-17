import 'package:flutter/material.dart';

import '../Widgets/ProductsGrid.dart';
import '../Widgets/ProductItem.dart';

class ProductsOverviewScreen extends StatelessWidget {
  // const ProductsOverviewScreen({Key? key}) : super(key: key);
  static const String id = '/product_overview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffc9ea),
      appBar: AppBar(
        // backgroundColor: Color(0xff93cd48),
        // backgroundColor: Color.fromRGBO(24, 13, 198, 1.0),
        title: Text('Shop Force'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: ProductsGrid(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white24,
                    Colors.red,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
          ),
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

