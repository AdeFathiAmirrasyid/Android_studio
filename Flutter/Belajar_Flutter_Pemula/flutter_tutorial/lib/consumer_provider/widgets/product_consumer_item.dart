import 'package:flutter/material.dart';
import 'package:flutter_tutorial/consumer_provider/providers/cart_consumer.dart';
import 'package:flutter_tutorial/state_management/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/product_consumer.dart';

class ProductConsumerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductConsumer>(context, listen: false);
    final cartData = Provider.of<CartConsumer>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<ProductConsumer>(
            builder: (context, productData, child) => IconButton(
              icon: (productData.isFavorite)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                productData.statusFav();
              },
            ),
          ),
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Add to cart"),
                duration: Duration(milliseconds: 500),
              ));
              cartData.addCart(
                  productData.id, productData.title, productData.price);
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: productData.id);
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
