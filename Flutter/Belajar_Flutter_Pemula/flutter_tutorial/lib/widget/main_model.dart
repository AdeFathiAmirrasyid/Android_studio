import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/page_model/model_product.dart';

void main() {
  runApp(MainModel());
}

class MainModel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModelProduct(),
    );
  }
}
