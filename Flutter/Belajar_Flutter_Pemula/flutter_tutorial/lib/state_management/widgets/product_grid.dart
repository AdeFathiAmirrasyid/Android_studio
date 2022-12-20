import 'package:flutter/material.dart';
import 'package:flutter_tutorial/state_management/providers/all_products.dart';
import 'package:flutter_tutorial/state_management/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProiductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<AllProducts>(context);
    final all_product = productData.allProduct;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: all_product.length,
      itemBuilder: (context, index) => ProductItem(
        all_product[index].id,
        all_product[index].title,
        all_product[index].imageUrl,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
    );
  }
}
