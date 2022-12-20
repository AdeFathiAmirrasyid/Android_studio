import 'package:flutter_tutorial/consumer_provider/providers/cart_consumer.dart';
import 'package:flutter_tutorial/consumer_provider/screens/cart_screen.dart';
import 'package:flutter_tutorial/consumer_provider/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/product_consumer_grid.dart';
import 'package:flutter/material.dart';

class ProductConsumerOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Myshop"),
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
      body: ProductConsumerGrid(),
    );
  }
}
