import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String title;
  final String? description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  ProductModel({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false,
  });

  void toggleFavoriteStatus() {
    isFavourite = !isFavourite;
    if (isFavourite == true) {
      print(' ${this.title} favourite');
    } else {
    print(' ${this.title} not favourite');
    }
    notifyListeners();

  }
}
