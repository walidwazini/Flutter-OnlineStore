import 'package:flutter/foundation.dart';

class CartModel {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

// NOTE: CarItem id is not a ProductItem id

class CartProvider with ChangeNotifier {
  // initialize as empty map
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItem({
    required String productId,
    required double price,
    required String title,
  }) {
    if (_items.containsKey(productId)) {
      // ..change quantity
      _items.update(
        productId,
        (existingCartItem) => CartModel(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartModel(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
