import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget_lifecycle/pages/counter_page.dart';
import 'package:flutter_tutorial/widget_lifecycle/pages/other_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
      routes: {
        CounterPage.routeName: (context) => CounterPage(),
        OtherPage.routeName: (context) => const OtherPage(),
      },
    );
  }
}
