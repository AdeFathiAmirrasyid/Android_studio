import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'nested_product.dart';

class NestedAllProducts with ChangeNotifier {
  final List<NestedProduct> _allProducts = List.generate(10, (index) {
    return NestedProduct(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        imageUrl: "https://picsum.photos/id/$index/200/300",
        price: 10 + Random().nextInt(100).toDouble(),
        desc: "Ini Adalah Product ${index + 1}");
  });

  List<NestedProduct> get allProduct {
    return [..._allProducts];
  }

  NestedProduct findById(productId) {
    return _allProducts.firstWhere((prodId) => prodId.id == productId);
  }
}
