import 'dart:math';

import '../widget_builder/widget/card_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget ListView"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => CardColors(
            textColors: "Angka ${index + 1}",
            colorRec: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256))),
      ),
    );
  }
}
