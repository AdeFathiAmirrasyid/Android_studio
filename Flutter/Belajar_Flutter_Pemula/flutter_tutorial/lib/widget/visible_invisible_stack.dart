import 'package:flutter/material.dart';

void main() {
  runApp(const VisibleInvisibleStack());
}

class VisibleInvisibleStack extends StatelessWidget {
  const VisibleInvisibleStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Row"),
        ),
        body: Stack(
          children: [
            Container(
              width: 400,
              height: 400,
              color: Colors.amber,
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.greenAccent,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.blueAccent,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
