import 'package:flutter/material.dart';

class RouterPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Router Photo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Router Photo",
              style: TextStyle(fontSize: 50, fontFamily: 'Viga'),
            ),
          ],
        ),
      ),
    );
  }
}
