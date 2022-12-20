import 'package:flutter/material.dart';
import 'package:flutter_tutorial/key/pages/add_product_page.dart';
import 'package:flutter_tutorial/key/pages/home_page.dart';
import 'package:flutter_tutorial/key/providers/providers_products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const KeyApp());
}

class KeyApp extends StatelessWidget {
  const KeyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProvidersProducts>(
      create: (context) => ProvidersProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          AddProductPage.routeName:(context) => const AddProductPage()
        },
      ),
    );
  }
}

