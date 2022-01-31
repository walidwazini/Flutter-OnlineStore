import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

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

  // var _showFavoritesOnly = false;

  List<ProductModel> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((element) => element.isFavourite).toList();
    // }
    return [..._items];
  }

  List<ProductModel> get favoriteItems {
    return _items.where((element) => element.isFavourite).toList();
  }

  ProductModel findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(ProductModel product) {
    final newProduct = ProductModel(
      id: Random().nextInt(3000).toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    // _items.add(newProduct);
    _items.insert(0, newProduct);
    notifyListeners();
  }

  void updateProducts(String? id, ProductModel newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }
}
