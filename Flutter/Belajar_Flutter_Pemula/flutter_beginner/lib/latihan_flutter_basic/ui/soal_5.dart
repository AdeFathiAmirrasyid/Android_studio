import 'package:flutter/material.dart';

class SoalLima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Soal - 5",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            color: Colors.indigo,
            child: const Center(
              child: Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
