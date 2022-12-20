import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'product_consumer.dart';

class AllProductConsumers with ChangeNotifier {
  final List<ProductConsumer> _allProducts = List.generate(10, (index) {
    return ProductConsumer(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        imageUrl: "https://picsum.photos/id/$index/200/300",
        price: 10 + Random().nextInt(100).toDouble(),
        desc: "Ini Adalah Product ${index + 1}");
  });

  List<ProductConsumer> get allProduct {
    return [..._allProducts];
  }

  ProductConsumer findById(productId) {
    return _allProducts.firstWhere((prodId) => prodId.id == productId);
  }
}
