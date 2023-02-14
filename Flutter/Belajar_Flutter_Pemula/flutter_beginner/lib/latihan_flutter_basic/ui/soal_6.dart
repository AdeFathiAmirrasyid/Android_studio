import 'package:flutter/material.dart';

class SoalEnam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Soal - 6",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Colors.indigo, borderRadius: BorderRadius.circular(200 / 2)),
            width: 200,
            height: 200,
            child: const Center(
              child: Text(
                "Hello World",
                style: TextStyle(
                  color: Colors.white,
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
