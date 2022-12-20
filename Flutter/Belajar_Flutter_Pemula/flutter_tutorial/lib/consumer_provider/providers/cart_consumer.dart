import 'package:flutter/material.dart';
import 'package:flutter_tutorial/consumer_provider/models/cart_item_consumer.dart';

class CartConsumer with ChangeNotifier {
  final Map<String, CartItemConsumer> _items = {};
  Map<String, CartItemConsumer> get items => _items;

  int get jumlah {
    return _items.length;
  }

  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.qty * cartItem.price;
    });
    return total;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItemConsumer(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItemConsumer(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              qty: 1));
    }
    notifyListeners();
  }
}
