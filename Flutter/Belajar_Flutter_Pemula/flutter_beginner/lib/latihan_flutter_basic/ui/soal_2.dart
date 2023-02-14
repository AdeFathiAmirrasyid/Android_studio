import 'package:flutter/material.dart';

class SoalDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Soal - 2",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            "Hello World",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
