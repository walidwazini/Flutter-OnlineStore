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
    notifyListeners();
    if (isFavourite == true) {
      print('favourite');
    } else {
    print('not favourite');
    }
  }
}
