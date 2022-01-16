import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen({required this.title,});
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productID =  ModalRoute.of(context)?.settings.arguments as String ;
    // Todo Get all data from id

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('title'),
      ),
    );
  }
}
