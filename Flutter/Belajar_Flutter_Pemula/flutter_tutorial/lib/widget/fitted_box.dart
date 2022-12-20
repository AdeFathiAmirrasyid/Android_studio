import 'package:flutter/material.dart';

void main() {
  runApp(const FittedBoxExample());
}

class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageFittedBox(),
    );
  }
}

class PageFittedBox extends StatelessWidget {
  const PageFittedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fitted Box")),
      body: Center(
        child: Container(
          width: 300,
          height: 100,
          color: Colors.indigo,
          child: const Center(
            child: FittedBox(
                child: Text("Hello",
                    style: TextStyle(fontSize: 50, color: Colors.white))),
          ),
        ),
      ),
    );
  }
}
