import 'package:flutter/material.dart';
import 'package:flutter_tutorial/consumer_provider/widgets/product_consumer_item.dart';
import 'package:provider/provider.dart';

import '../providers/all_product_consumers.dart';

class ProductConsumerGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<AllProductConsumers>(context);
    final all_product = productData.allProduct;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: all_product.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: all_product[index],
        child: ProductConsumerItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
    );
  }
}
