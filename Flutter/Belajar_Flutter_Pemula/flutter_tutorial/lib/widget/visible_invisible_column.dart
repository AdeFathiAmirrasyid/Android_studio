import 'package:flutter/material.dart';

void main() {
  runApp(const VisibleInvisibleColumn());
}

class VisibleInvisibleColumn extends StatelessWidget {
  const VisibleInvisibleColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Column"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 200,
              height: 50,
              color: Colors.amber,
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.greenAccent,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.blueAccent,
            ),
            Container(
              width: 300,
              height: 50,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
