import 'package:flutter/material.dart';
import 'package:flutter_tutorial/consumer_provider/providers/all_product_consumers.dart';
import 'package:flutter_tutorial/consumer_provider/providers/cart_consumer.dart';
import 'package:flutter_tutorial/consumer_provider/screens/cart_screen.dart';
import 'package:flutter_tutorial/consumer_provider/screens/product_consumer_detail_screen.dart';
import 'package:flutter_tutorial/consumer_provider/screens/product_consumer_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartConsumer(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllProductConsumers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
                .copyWith(secondary: Colors.amber)),
        home: ProductConsumerOverViewScreen(),
        routes: {
          ProductConsumerDetailScreen.routeName: (context) =>
              ProductConsumerDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
