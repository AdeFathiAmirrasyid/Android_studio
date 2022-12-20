import 'package:flutter/material.dart';
import 'package:flutter_tutorial/key/pages/add_product_page.dart';
import 'package:flutter_tutorial/key/providers/providers_products.dart';
import 'package:flutter_tutorial/key/widgets/product_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProvidersProducts>(context);
    var allProducts = products.allProducts;
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Product"),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AddProductPage.routeName),
                icon: const Icon(Icons.add))
          ],
        ),
        body: (allProducts.isEmpty)
            ? const Center(
                child: Text(
                "No Data",
                style: TextStyle(fontSize: 20),
              ))
            : ListView(
                children: allProducts
                    .map((e) => ProductItem(
                          ValueKey(e.id),
                          e.id,
                          e.title,
                          e.date,
                        ))
                    .toList(),
              ));
  }
}
