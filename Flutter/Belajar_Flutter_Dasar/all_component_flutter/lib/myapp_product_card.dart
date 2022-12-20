import 'package:all_component_flutter/product_card/product_card_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppProductCard extends StatelessWidget {
  const MyAppProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: firstColor,
          ),
          body: ChangeNotifierProvider<ProductState>(
            create: (context) => ProductState(),
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Consumer<ProductState>(
                    builder: (context, productState, _) => ProductCardExample(
                      imageURL:
                          "https://images.unsplash.com/photo-1519996529931-28324d5a630e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                      name: "Buah-buahan Mix 1 kg",
                      price: "Rp25.000",
                      quantity: productState.quantity,
                      notification:
                          (productState.quantity > 5) ? "Diskon 10%" : '',
                      onAddCartTap: () {},
                      onIncTap: () {
                        productState.quantity++;
                      },
                      onDecTap: () {
                        productState.quantity--;
                      },
                    ),
                  )),
            ),
          )),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }
}
