import 'package:flutter/material.dart';

import '../models/key_product.dart';

class ProvidersProducts extends ChangeNotifier {
  final List<KeyProduct> _data = [];

  List<KeyProduct> get allProducts => _data;

  void addProduct(String title, DateTime date) {
    var product = KeyProduct(DateTime.now().toString(), title, date);

    _data.add(product);
    notifyListeners();
  }
  void deleteProduct(String id){
    _data.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
