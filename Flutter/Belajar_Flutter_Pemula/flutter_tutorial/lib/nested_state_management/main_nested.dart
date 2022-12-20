import 'package:flutter/material.dart';
import 'package:flutter_tutorial/nested_state_management/providers/nested_all_products.dart';
import 'package:flutter_tutorial/nested_state_management/screens/nested_product_detail_screen.dart';
import 'package:flutter_tutorial/nested_state_management/screens/nested_product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NestedAllProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
                .copyWith(secondary: Colors.amber)),
        home: NestedProductOverViewScreen(),
        routes: {
          NestedProductDetailScreen.routeName: (context) =>
              NestedProductDetailScreen(),
        },
      ),
    );
  }
}
