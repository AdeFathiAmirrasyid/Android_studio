import 'dart:math';

import '../mapping_collections/widget/card_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<Map<String, dynamic>> data = List.generate(
      20,
      (index) => {
            "textColors": "Angka - ${index + 1}",
            "colorRec": Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256))
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapping Collections"),
      ),
      body: ListView(
        children: data.map((e) => CardColors(textColors: e["textColors"], colorRec: e['colorRec'])).toList(),
      ),
    );
  }
}
