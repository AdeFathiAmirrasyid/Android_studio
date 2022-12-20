import 'package:flutter/material.dart';
import 'package:flutter_tutorial/state_management/providers/all_products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<AllProducts>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            product.title,
            style: const TextStyle(fontFamily: 'Viga', fontSize: 35),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "\$${product.price}",
            style: const TextStyle(fontFamily: 'Lato', fontSize: 24),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            product.desc,
            style: const TextStyle(fontFamily: 'Lato', fontSize: 24),
          )
        ],
      ),
    );
  }
}
