import 'package:flutter/material.dart';
import 'package:flutter_tutorial/nested_state_management/widgets/nested_product_item.dart';
import 'package:provider/provider.dart';

import '../providers/nested_all_products.dart';

class NestedProiductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<NestedAllProducts>(context);
    final all_product = productData.allProduct;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: all_product.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: all_product[index],
        child: NestedProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
    );
  }
}
