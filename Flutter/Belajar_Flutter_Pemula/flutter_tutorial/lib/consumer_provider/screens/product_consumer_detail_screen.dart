import 'package:flutter/material.dart';
import 'package:flutter_tutorial/consumer_provider/providers/cart_consumer.dart';
import 'package:flutter_tutorial/consumer_provider/screens/cart_screen.dart';
import 'package:flutter_tutorial/consumer_provider/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../providers/all_product_consumers.dart';

class ProductConsumerDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product =
        Provider.of<AllProductConsumers>(context).findById(productId);
    final cart = Provider.of<CartConsumer>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        actions: [
          Consumer<CartConsumer>(
            builder: (context, value, ch){
              return Badge(
                value: value.jumlah.toString(),
                color: Colors.amber,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
              );
            },
          )
        ],
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
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Add to cart"),
                  duration: Duration(milliseconds: 500),
                ));
                cart.addCart(product.id, product.title, product.price);
              },
              child: const Text(
                "Add to cart",
                style: TextStyle(fontSize: 24),
              ))
        ],
      ),
    );
  }
}
