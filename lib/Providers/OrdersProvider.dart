import 'dart:math';

import 'package:flutter/material.dart';

import './CartProvider.dart';

class OrderItemModel {
  final String orderId;
  final double amount;
  final List<CartModel> products;
  final DateTime dateTime;

  OrderItemModel({
    required this.orderId,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class OrdersProvider with ChangeNotifier {
  List<OrderItemModel> _orders = [];

  List<OrderItemModel> get orders {
    return [..._orders];
  }

  void addOrder({required List<CartModel> cartProducts, required double total}) {
    _orders.insert(
      0,
      OrderItemModel(
          orderId: Random().nextInt(5000).toString(),
          products: cartProducts,
          amount: total,
          dateTime: DateTime.now()),
    );
    notifyListeners();
  }
}
