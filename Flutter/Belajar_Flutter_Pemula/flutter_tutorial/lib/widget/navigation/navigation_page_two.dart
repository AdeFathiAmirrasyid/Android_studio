import 'package:flutter/material.dart';

class NavigationPagetwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Two"),),
      body: const Center(
        child: Text(
          "Page Two",
          style: TextStyle(fontSize: 30, fontFamily: 'Viga'),
        ),
      ),
    );
  }
}
