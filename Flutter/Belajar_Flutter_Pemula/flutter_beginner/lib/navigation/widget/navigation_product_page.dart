import 'package:flutter/material.dart';

import 'navigation_product_detail_page.dart';

class NavigationProductPage extends StatelessWidget {
  const NavigationProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("back to home"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NavigationProductDetailPage()));
              },
              child: const Text("Go to Detail Product"),
            ),
          ],
        ),
      ),
    );
  }
}
