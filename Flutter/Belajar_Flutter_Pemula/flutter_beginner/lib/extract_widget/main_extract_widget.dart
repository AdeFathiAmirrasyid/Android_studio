import 'package:app/extract_widget/widget/card_colors.dart';
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
        title: const Text("Extract Widget"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CardColors(colorRec: Colors.blueAccent, textColors: "BlueAccent"),
              CardColors(colorRec: Colors.red, textColors: "Red"),
              CardColors(
                  colorRec: Colors.greenAccent, textColors: "GreenAccent"),
              CardColors(colorRec: Colors.deepPurple, textColors: "DeepPurple"),
              CardColors(colorRec: Colors.indigo, textColors: "Indigo"),
            ],
          ),
        ],
      ),
    );
  }
}
