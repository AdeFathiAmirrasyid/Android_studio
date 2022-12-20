import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../models/product.dart';

class AllProducts with ChangeNotifier {
  final List<Product> _allProducts = List.generate(10, (index) {
    return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        imageUrl: "https://picsum.photos/id/$index/200/300",
        price: 10 + Random().nextInt(100).toDouble(),
        desc: "Ini Adalah Product ${index + 1}");
  });

  List<Product> get allProduct {
    return [..._allProducts];
  }

  Product findById(productId){
    return _allProducts.firstWhere((prodId) => prodId.id == productId);
  }
}
