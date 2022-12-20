import 'package:flutter/material.dart';

void main() {
  runApp(const VisibleInvisibleRow());
}

class VisibleInvisibleRow extends StatelessWidget {
  const VisibleInvisibleRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Row"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 200,
              color: Colors.amber,
            ),
            Container(
              width: 50,
              height: 100,
              color: Colors.greenAccent,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.blueAccent,
            ),
            Container(
              width: 50,
              height: 300,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
