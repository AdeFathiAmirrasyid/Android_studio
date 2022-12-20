import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/navigation/navigation_page_one.dart';

void main() {
  runApp(const MainNavigation());
}

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationPageOne(),
    );
  }
}
