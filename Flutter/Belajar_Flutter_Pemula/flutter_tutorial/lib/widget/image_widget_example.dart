import 'package:flutter/material.dart';

void main() {
  runApp(const ImageWidgetExample());
}

class ImageWidgetExample extends StatelessWidget {
  const ImageWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Widget"),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            color: Colors.amber,
            child: const Image(image: AssetImage("images/marko.png"),
            fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
