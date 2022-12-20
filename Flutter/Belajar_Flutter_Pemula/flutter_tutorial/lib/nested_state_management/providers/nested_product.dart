import 'package:flutter/cupertino.dart';

class NestedProduct with ChangeNotifier{
  final String id;
  final String title;
  final String desc;
  final double price;
  final String imageUrl;
  bool isFavorite;

  NestedProduct(
      {required this.id,
      required this.title,
      required this.desc,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  void statusFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
