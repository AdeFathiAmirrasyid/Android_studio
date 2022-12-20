import '../widgets/product_grid.dart';
import 'package:flutter/material.dart';

class ProductOverViewScreen extends StatelessWidget {
  const ProductOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Myshop"),
      ),
      body: ProiductGrid(),
    );
  }
}
