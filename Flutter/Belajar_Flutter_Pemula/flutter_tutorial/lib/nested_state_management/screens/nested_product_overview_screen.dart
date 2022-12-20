import '../widgets/nested_product_grid.dart';
import 'package:flutter/material.dart';

class NestedProductOverViewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Myshop"),
      ),
      body: NestedProiductGrid(),
    );
  }
}
