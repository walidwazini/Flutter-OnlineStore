import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProductModel.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _items = [
    ProductModel(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://picsum.photos/200/300/',
    ),
    ProductModel(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl: 'https://picsum.photos/200/300/'),
    ProductModel(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageUrl: 'https://picsum.photos/200/300/'),
    ProductModel(
        id: 'p4',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl: 'https://picsum.photos/200/300/'),
  ];

  List<ProductModel> get items {
    return [..._items];
  }

  void addProduct(){
    // _items.add(value);
    notifyListeners();
  }
}